return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local onedark = require("onedark")

      -- Initialize with time-based theme
      local hour = tonumber(os.date("%H"))
      local is_daytime = hour >= 6 and hour < 18

      -- Configure theme
      onedark.setup({
        style = is_daytime and "light" or "dark",
        highlights = {
          NeoTreeNormal = { bg = "NONE" },
          NeoTreeNormalNC = { bg = "NONE" },
          NeoTreeEndOfBuffer = { bg = "NONE" },
        },
      })

      -- Function to toggle theme
      local function toggle_theme()
        local current_style = vim.g.onedark_config.style
        local new_style = current_style == "dark" and "light" or "dark"
        onedark.setup({ style = new_style })
        vim.cmd.colorscheme("onedark")
      end

      -- Create user command for toggling
      vim.api.nvim_create_user_command("ToggleTheme", toggle_theme, {})

      -- Optionally, set up a keybinding (uncomment to use)
      -- vim.keymap.set("n", "<leader>tt", toggle_theme, { desc = "Toggle theme" })

      -- Apply initial colorscheme
      vim.cmd.colorscheme("onedark")
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "onedark",
    },
  },
}
