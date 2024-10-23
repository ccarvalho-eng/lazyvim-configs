return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      -- Get current hour (0-23)
      local hour = tonumber(os.date("%H"))
      -- Set light theme during day (e.g., 6 AM to 6 PM)
      local is_daytime = hour >= 6 and hour < 18

      require("onedark").setup({
        style = is_daytime and "light" or "dark",
      })
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
