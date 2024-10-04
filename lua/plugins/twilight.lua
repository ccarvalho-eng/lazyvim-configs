return {
  {
    "folke/twilight.nvim",
    keys = {
      { "<leader>ut", ":Twilight<CR>", desc = "Toggle Twilight" },
    },
    config = function()
      require("twilight").setup({
        dimming = {
          alpha = 0.25,
        },
        context = 10,
      })
    end,
  },
}
