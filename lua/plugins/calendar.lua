return {
  {
    "itchyny/calendar.vim",
    lazy = true,
    cmd = { "Calendar" },
    keys = {
      { "<leader>h", "<cmd>Calendar<cr>", desc = "Calendar" },
    },
    config = function()
      vim.g.calendar_google_calendar = 1
      vim.g.calendar_google_task = 1
      vim.g.calendar_view = "week"
    end,
  },
}
