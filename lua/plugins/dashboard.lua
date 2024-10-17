local function get_random_header_quote()
  local header_quotes = require("plugins.dashboard.header_quotes")
  local random_index = math.random(#header_quotes)
  local selected_quote = header_quotes[random_index]

  return selected_quote.quote .. "\n-" .. selected_quote.author
end

local function get_random_footer_quote()
  local footer_quotes = require("plugins.dashboard.footer_quotes")
  math.randomseed(os.time())
  return footer_quotes[math.random(#footer_quotes)]
end

local function wrap_text(text, max_width)
  local wrapped = {}
  local line = ""
  for word in text:gmatch("%S+") do
    if #line + #word + 1 > max_width then
      table.insert(wrapped, line)
      line = word
    else
      if #line > 0 then
        line = line .. " " .. word
      else
        line = word
      end
    end
  end
  if #line > 0 then
    table.insert(wrapped, line)
  end
  return wrapped
end

return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    -- Ensure the random seed is initialized for randomness
    math.randomseed(os.time())

    -- Get the header quote and separate the quote and author
    local header_quote = get_random_header_quote()
    local quote_text, author = header_quote:match("^(.-)\n%-(.+)$")

    -- Wrap the quote text only, and append the author on a new line
    local wrapped_quote_text = wrap_text(quote_text, 80)
    table.insert(wrapped_quote_text, "-" .. author)

    local logo = string.format(
      [[
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
    ]],
      table.concat(wrapped_quote_text, "\n")
    )
    logo = string.rep("\n", 4) .. logo .. string.rep("\n", 2)
    opts.config.header = vim.split(logo, "\n")
    opts.config.footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      local random_quote = get_random_footer_quote()
      local wrapped_quote = wrap_text(random_quote[1], 80)
      local footer = {
        "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
        "",
      }

      for _, line in ipairs(wrapped_quote) do
        table.insert(footer, line)
      end

      table.insert(footer, "")
      return footer
    end
    return opts
  end,
}
