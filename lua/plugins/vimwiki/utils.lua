local M = {}

local function load_template(name)
  local template_path = string.format("plugins.vimwiki.templates.%s", name)
  local ok, template = pcall(require, template_path)
  if not ok then
    vim.notify("Failed to load template: " .. name, vim.log.levels.ERROR)
    return nil
  end
  return template
end

local function get_wiki_path()
  local wiki_path = os.getenv("VIMWIKI_PATH")
  if wiki_path then
    if not wiki_path:match("/$") then
      wiki_path = wiki_path .. "/"
    end
    return wiki_path
  end

  local wiki_list = vim.g.vimwiki_list
  if wiki_list and #wiki_list > 0 then
    local path = vim.fn.expand(wiki_list[1].path)
    if not path:match("/$") then
      path = path .. "/"
    end
    return path
  end

  return vim.fn.expand("~/Documents/vimwiki/")
end

local function create_or_open_file(filepath, template_content)
  local expanded_path = vim.fn.expand(filepath)
  local dir = vim.fn.fnamemodify(expanded_path, ":h")
  if vim.fn.isdirectory(dir) == 0 then
    local ok = vim.fn.mkdir(dir, "p")
    if ok == 0 then
      vim.notify("Failed to create directory: " .. dir, vim.log.levels.ERROR)
      return
    end
  end

  local file_exists = vim.fn.filereadable(expanded_path) == 1
  local ok, err = pcall(vim.cmd, "edit " .. expanded_path)
  if not ok then
    vim.notify("Failed to open file: " .. expanded_path .. (err and (" (" .. err .. ")") or ""), vim.log.levels.ERROR)
    return
  end

  if not file_exists and template_content then
    local ok_buf = pcall(vim.api.nvim_buf_set_lines, 0, 0, 0, false, vim.split(template_content, "\n"))
    if not ok_buf then
      vim.notify("Failed to set buffer lines for: " .. expanded_path, vim.log.levels.ERROR)
      return
    end
    local ok_write, err_write = pcall(vim.cmd, "write")
    if not ok_write then
      vim.notify(
        "Failed to write file: " .. expanded_path .. (err_write and (" (" .. err_write .. ")") or ""),
        vim.log.levels.ERROR
      )
      return
    end
  end
end

function M.weekly_note()
  local date = os.date("*t")
  local week_num = os.date("%V")
  local year = date.year
  local week_start = os.date("%Y-%m-%d", os.time() - (date.wday - 2) * 86400)

  local filename = string.format("journal/weekly/%d-W%02d.md", year, week_num)
  local filepath = get_wiki_path() .. filename

  local template_str = load_template("weekly")
  if not template_str then
    return
  end

  local template = string.format(template_str, week_num, year, week_start, os.date("%Y-%m-%d %H:%M"))

  create_or_open_file(filepath, template)
end

function M.monthly_note()
  local date = os.date("*t")
  local month_name = os.date("%B")
  local year = date.year
  local month_num = date.month

  local filename = string.format("journal/monthly/%d-%02d.md", year, month_num, month_name)
  local filepath = get_wiki_path() .. filename

  local template_str = load_template("monthly")
  if not template_str then
    return
  end

  local template = string.format(template_str, month_name, year, os.date("%Y-%m-%d %H:%M"))

  create_or_open_file(filepath, template)
end

function M.quarterly_note()
  local date = os.date("*t")
  local quarter = math.ceil(date.month / 3)
  local year = date.year

  local filename = string.format("journal/quarterly/%d-Q%d.md", year, quarter)
  local filepath = get_wiki_path() .. filename

  local months = {
    [1] = "January - March",
    [2] = "April - June",
    [3] = "July - September",
    [4] = "October - December",
  }

  local template_str = load_template("quarterly")
  if not template_str then
    return
  end

  local template = string.format(template_str, quarter, year, months[quarter], os.date("%Y-%m-%d %H:%M"))

  create_or_open_file(filepath, template)
end

function M.yearly_note()
  local year = os.date("%Y")
  local filename = string.format("journal/yearly/%s.md", year)
  local filepath = get_wiki_path() .. filename

  local template_str = load_template("yearly")
  if not template_str then
    return
  end

  local template = string.format(template_str, year, tonumber(year) + 1, os.date("%Y-%m-%d %H:%M"))

  create_or_open_file(filepath, template)
end

function M.daily_diary()
  local date_str = os.date("%Y-%m-%d")
  local day_name = os.date("%A")
  local filename = string.format("journal/daily/%s.md", date_str)
  local filepath = get_wiki_path() .. filename
  local template_str = load_template("daily")
  if not template_str then
    return
  end

  local template = string.format(template_str, day_name, date_str, os.date("%Y-%m-%d %H:%M"))

  create_or_open_file(filepath, template)
end

function M.quick_diary()
  local date_str = os.date("%Y-%m-%d")
  local filename = string.format("journal/daily/%s.md", date_str)
  local filepath = get_wiki_path() .. filename
  local template_str = load_template("quick")
  if not template_str then
    return
  end

  local template = string.format(template_str, date_str, os.date("%H:%M"))

  create_or_open_file(filepath, template)
end

function M.diary_with_time()
  local date_str = os.date("%Y-%m-%d")
  local time_str = os.date("%H:%M")
  local filename = string.format("journal/daily/%s.md", date_str)
  local filepath = get_wiki_path() .. filename
  local expanded_path = vim.fn.expand(filepath)
  local file_exists = vim.fn.filereadable(expanded_path) == 1

  if file_exists then
    vim.cmd("edit " .. expanded_path)
    local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
    local new_entry = string.format("\n## %s\n- ", time_str)
    table.insert(lines, new_entry)
    vim.api.nvim_buf_set_lines(0, -1, -1, false, { new_entry })
    vim.cmd("write")
    vim.api.nvim_win_set_cursor(0, { #lines + 1, 2 })
  else
    local day_name = os.date("%A")
    local template_str = load_template("time_entry")
    if not template_str then
      return
    end

    local template = string.format(template_str, day_name, date_str, time_str, os.date("%Y-%m-%d %H:%M"))

    create_or_open_file(filepath, template)
    vim.schedule(function()
      vim.api.nvim_win_set_cursor(0, { 4, 2 })
    end)
  end
end

return M
