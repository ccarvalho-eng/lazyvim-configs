local M = {}

-- Logo generation
function M.generate_logo(quote_text, author)
  local wrapped_quote_text = {}
  local line = ""
  local width = 80

  -- Wrap quote text
  for word in quote_text:gmatch("%S+") do
    if #line + #word + 1 > width then
      table.insert(wrapped_quote_text, line)
      line = word
    else
      line = #line > 0 and (line .. " " .. word) or word
    end
  end
  if #line > 0 then
    table.insert(wrapped_quote_text, line)
  end
  table.insert(wrapped_quote_text, "-" .. author)

  local logo_template = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡿⠙⠀⠀⠀⠀⠋⢿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠇⠀⣺⠀⠀⠀⠀⠸⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡟⠀⢀⣾⣷⣖⠊⠀⠀⢻⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⡃⠀⣸⠏⠉⠈⠻⣆⠀⠸⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⡀⠀⠀⠀⢀⣠⡴⠇⠀⣀⣿⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⣻⡃⠙⠂⢀⣾⡟⠉⠀⠀⠐⠉⢙⣿⣾⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⡿⠀⢀⡀⠘⣿⣧⡀⠀⠀⢀⡀⠀⣿⣿⣽⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⡿⣷⣿⣄⣤⢿⣾⣿⣿⣿⣰⣷⣿⢤⣤⣾⣿⣯⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣯⣿⣿⣽⣿⣿⣿⣿⣽⣿⣿⣿⡿⣿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⠾⣿⡿⣿⣿⣿⣿⣟⣯⠿⣿⣽⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢻⣿⣿⠃⠈⠇⠈⢿⣿⡇⠸⠁⢐⣿⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⡀⠀⠀⠀⠈⣿⡇⠀⠀⢀⣿⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⣶⡀⠀⢀⣿⡇⠠⣴⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢿⣿⠄⢀⣾⠋⠀⠐⣿⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⠂⢺⡇⠀⠀⠀⠙⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠅⢀⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠠⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣶⣶⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀

    [ %s ]
    ]]

  return string.format(logo_template, table.concat(wrapped_quote_text, "\n"))
end

-- Main configuration function
function M.configure(_, opts)
  -- Initialize random seed for quote selection
  math.randomseed(os.time())

  -- Load quotes
  local header_quotes = require("plugins.dashboard.header_quotes")

  -- Select random header quote
  local selected_header_quote = header_quotes[math.random(#header_quotes)]
  local quote_text, author = selected_header_quote.quote, selected_header_quote.author

  -- Generate logo
  local logo = M.generate_logo(quote_text, author)
  opts.config.header = vim.split(string.rep("\n", 4) .. logo .. string.rep("\n", 2), "\n")

  -- Configure footer
  opts.config.footer = function()
    -- Load stats
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)

    -- Load quotes
    local footer_quotes = require("plugins.dashboard.footer_quotes")

    -- Select random footer quote
    local random_footer_quote = footer_quotes[math.random(#footer_quotes)]
    local wrapped_footer_quote = {}
    local line = ""
    local width = 80

    -- Wrap quote text
    for word in random_footer_quote[1]:gmatch("%S+") do
      if #line + #word + 1 > width then
        table.insert(wrapped_footer_quote, line)
        line = word
      else
        line = #line > 0 and (line .. " " .. word) or word
      end
    end
    if #line > 0 then
      table.insert(wrapped_footer_quote, line)
    end

    local footer = {
      string.format("⚡ Neovim loaded %d/%d plugins in %.2fms", stats.loaded, stats.count, ms),
      "",
    }
    vim.list_extend(footer, wrapped_footer_quote)
    table.insert(footer, "")

    return footer
  end

  return opts
end

return {
  "nvimdev/dashboard-nvim",
  opts = M.configure,
}
