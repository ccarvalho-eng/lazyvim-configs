return {
  {
    "nvim-neorg/neorg",
    lazy = false,
    version = "*",
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = vim.env.NEORG_PATH or "~/notes",
              },
              default_workspace = "notes",
            },
          },
        },
      })
    end,
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}