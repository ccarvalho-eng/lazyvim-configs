return {
  {
    "itchyny/calendar.vim",
    lazy = true,
    cmd = { "Calendar" },
    keys = {
      { "<leader>h", desc = "Calendar" },
      { "<leader>he", "<cmd>Calendar<cr>", desc = "Open Calendar" },
    },
    config = function()
      vim.g.calendar_google_calendar = 1
      vim.g.calendar_google_task = 1
      vim.g.calendar_view = "week"
    end,
  },
}
