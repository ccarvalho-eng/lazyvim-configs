return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "dark", -- Choose the style: dark, darker, cool, deep, warm, warmer
    },
    config = function(_, opts)
      require("onedark").setup(opts)
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
