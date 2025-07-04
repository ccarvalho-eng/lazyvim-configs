return {
  "neo451/feed.nvim",
  event = "VeryLazy",
  cmd = "Feed",
  ---@module 'feed'
  ---@type feed.config
  opts = {
    feeds = require("plugins.feed.config"),
  },
  -- Key mappings for easy access
  keys = {
    { "<leader>rf", "<cmd>Feed index<cr>", desc = "Open RSS Feed Reader" },
    { "<leader>ru", "<cmd>Feed update<cr>", desc = "Update All RSS Feeds" },
  },
}
