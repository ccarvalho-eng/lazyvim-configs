local M = {}

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
  vim.fn.mkdir(dir, "p")

  local file_exists = vim.fn.filereadable(expanded_path) == 1
  vim.cmd("edit " .. expanded_path)

  if not file_exists and template_content then
    vim.api.nvim_buf_set_lines(0, 0, 0, false, vim.split(template_content, "\n"))
    vim.cmd("write")
  end
end

function M.weekly_note()
  local date = os.date("*t")
  local week_num = os.date("%V")
  local year = date.year
  local week_start = os.date("%Y-%m-%d", os.time() - (date.wday - 2) * 86400)

  local filename = string.format("journal/weekly/%d-W%02d.md", year, week_num)
  local filepath = get_wiki_path() .. filename

  local template = string.format(
    [[# Week %s, %d

**Start Date:** %s

## 🏋️ Weekly Goals
- [ ]

## ✅ Wins
- 

## 📋 Habits

| Habit        | M | T | W | T | F | S | S |
|--------------|---|---|---|---|---|---|---|
| Gym          |   |   |   |   |   |   |   |
| Water (2L)   |   |   |   |   |   |   |   |
| Sleep 8h     |   |   |   |   |   |   |   |

## 📊 Review
- Good:
- Improve:
- Focus:

---
*Created: %s*]],
    week_num,
    year,
    week_start,
    os.date("%Y-%m-%d %H:%M")
  )

  create_or_open_file(filepath, template)
end

function M.monthly_note()
  local date = os.date("*t")
  local month_name = os.date("%B")
  local year = date.year
  local month_num = date.month

  local filename = string.format("journal/monthly/%d-%02d-%s.md", year, month_num, month_name)
  local filepath = get_wiki_path() .. filename

  local template = string.format(
    [[# %s %d

## 🎯 Goals
- [ ]

## 📌 Events
- 

## 🔧 Projects
- 

## 📋 Habit Tracker

| Habit        | W1 | W2 | W3 | W4 | Notes         |
|--------------|----|----|----|----|---------------|
| Gym          |    |    |    |    |               |
| Water (2L)   |    |    |    |    |               |
| Reading      |    |    |    |    |               |

## 🏆 Highlights
- 

## 📖 Reflection
- Wins:
- Challenges:
- Lessons:

## ⏭ Next Month
- Focus:
- Priorities:

---
*Created: %s*]],
    month_name,
    year,
    os.date("%Y-%m-%d %H:%M")
  )

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

  local template = string.format(
    [[# Q%d %d (%s)

## 🎯 OKRs

| Objective      | Key Result        | Status |
|----------------|-------------------|--------|
|                |                   | [ ]    |
|                |                   | [ ]    |

## 📋 Overview
- 

## 🛠 Projects
- 

## 📈 Metrics

| Metric         | Value |
|----------------|-------|
| Gym Hours      |       |
| Books Read     |       |
| Sleep Avg (h)  |       |

## 📖 Review
- Successes:
- Struggles:
- Insights:

## 🔭 Next Quarter
- Focus:
- Key Projects:

---
*Created: %s*]],
    quarter,
    year,
    months[quarter],
    os.date("%Y-%m-%d %H:%M")
  )

  create_or_open_file(filepath, template)
end

function M.yearly_note()
  local year = os.date("%Y")
  local filename = string.format("journal/yearly/%s-Year-Review.md", year)
  local filepath = get_wiki_path() .. filename
  local filepath = get_wiki_path() .. filename

  local template = string.format(
    [[# %s Year in Review

## 📋 Summary
- 

## 🏆 Goals
- [ ]

## 📈 Metrics

| Area       | Metric        | Value |
|------------|----------------|--------|
| Health     | Gym Sessions   |        |
| Personal   | Books Read     |        |
| Sleep      | Avg Hours/Night|        |
| Work       | Projects Done  |        |

## 💡 Highlights
- 

## 🧠 Lessons
- 

## 🔮 Vision %d
- Goals:
- Focus:

---
*Created: %s*]],
    year,
    tonumber(year) + 1,
    os.date("%Y-%m-%d %H:%M")
  )

  create_or_open_file(filepath, template)
end

function M.daily_diary()
  local date_str = os.date("%Y-%m-%d")
  local date_str = os.date("%Y-%m-%d")
  local day_name = os.date("%A")
  local filename = string.format("journal/diary/%s.md", date_str)
  local filepath = get_wiki_path() .. filename

  local template = string.format(
    [[# %s - %s

## 🔥 Focus
- [ ]

## 📅 Schedule
- Morning:
- Afternoon:
- Evening:

## 💪 Wellness

| Tracker    | Done? |
|------------|--------|
| Water      | [ ] [ ] [ ] [ ] [ ] [ ] [ ] |
| Gym        | [ ]    |
| Sleep 8h   | [ ]    |
| Mood       | 🙂😐😞 |

## 📝 Log
- 

## 💬 Reflection
- Wins:
- Challenges:
- Notes:

## ⏭ Tomorrow
- [ ]

---
*Created: %s*]],
    day_name,
    date_str,
    os.date("%Y-%m-%d %H:%M")
  )

  create_or_open_file(filepath, template)
end

function M.quick_diary()
  local date_str = os.date("%Y-%m-%d")
  local filename = string.format("journal/diary/%s.md", date_str)
  local filepath = get_wiki_path() .. filename

  local template = string.format(
    [[# %s

## Today
- 

## Tasks
- [ ]

## Notes
- 

---
*%s*]],
    date_str,
    os.date("%H:%M")
  )

  create_or_open_file(filepath, template)
end

function M.diary_with_time()
  local date_str = os.date("%Y-%m-%d")
  local time_str = os.date("%H:%M")
  local filename = string.format("journal/diary/%s.md", date_str)
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
    local template = string.format(
      [[# %s - %s

## %s
- 

---
*Started: %s*]],
      day_name,
      date_str,
      time_str,
      os.date("%Y-%m-%d %H:%M")
    )

    create_or_open_file(filepath, template)
    vim.schedule(function()
      vim.api.nvim_win_set_cursor(0, { 4, 2 })
    end)
  end
end

return M
