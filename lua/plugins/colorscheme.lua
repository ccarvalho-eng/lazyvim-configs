return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local onedark = require("onedark")

      -- Configure theme with a default style (you can choose 'dark' or 'light' as default)
      onedark.setup({
        style = "dark", -- Set a default style
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
      -- Create keymap for toggling
      vim.keymap.set("n", "<leader>cb", toggle_theme, { desc = "Toggle theme" })

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
