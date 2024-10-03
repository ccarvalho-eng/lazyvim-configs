return {
  "nvimdev/dashboard-nvim",
  opts = function(_, opts)
    -- Specific tenet
    local tenet = "We work in the dark to serve the light"

    -- Logo
    local logo = string.format(
      [[
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⠋⢿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡏⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⡿⠀⠀⠀⠹⣿⣿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⣿⠃⠀⠀⠀⠀⢹⣿⣿⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⠇⠀⠀⠀⠀⠀⠀⢻⣿⣷⡀⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠀⣰⣿⡟⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠘⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⣠⣿⣿⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣿⣿⣷⣄⠀⠀⠀⠀⠀
    ⠈⣶⣦⣤⣶⣿⣿⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣷⣶⣾⠇
    ⠀⢻⣿⣿⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣿⣿⣿⣿⣿⣿⠀
    ⠀⣼⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣿⣿⣿⣿⣿⣿⠀
    ⠀⠛⠻⢿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⡿⠟⠛⠃
    ⠀⠀⠀⠀⠙⠿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⡿⠋⠀⠀⠀⠀
    ⠀⠀⠑⠄⡀⠀⠈⠙⠳⢦⣀⠀⠀⠀⠀⠀⠀⠀⢀⡠⠶⠋⠁⠀⢀⡠⠊⠀⠀⠀
    ⠀⠀⠀⠀⠈⠒⢤⣀⠀⠀⠀⠁⠀⠀⣠⣄⠀⠀⠀⠀⠀⣀⡤⠒⠁⠀⠀⠀⠀⠀
    ⠀⠀⠀⠀⠀⠀⠀⠈⠉⠛⠷⠶⢶⣿⣿⣿⣿⡷⠶⠾⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀

    [ %s ]
    ]],
      tenet
    )

    logo = string.rep("\n", 8) .. logo .. "\n\n"
    opts.config.header = vim.split(logo, "\n")

    -- Specific quote
    local quote = [[
When I was a young man, I had liberty, but I did not see it. I had time,
but I did not know it. And I had love, but I did not feel it.

- Ezio Auditore]]

    -- Function to wrap text to a specific width
    local function wrap_text(text, width)
      local wrapped = {}
      local line = ""
      for word in text:gmatch("%S+") do
        if #line + #word + 1 > width then
          table.insert(wrapped, line)
          line = word
        else
          line = #line == 0 and word or line .. " " .. word
        end
      end
      if #line > 0 then
        table.insert(wrapped, line)
      end
      return wrapped
    end

    -- Set up the footer with plugin info and the wrapped quote
    opts.config.footer = function()
      local stats = require("lazy").stats()
      local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
      local wrapped_quote = wrap_text(quote, 80)

      local footer = {
        "⚡ Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
        "",
      }

      for _, line in ipairs(wrapped_quote) do
        table.insert(footer, line)
      end

      return footer
    end

    return opts
  end,
}
