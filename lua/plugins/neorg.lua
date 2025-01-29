return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Neorg",
    ft = "norg",
    opts = function()
      local root_dir = os.getenv("NEORG_NOTES")
      return {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                journal = root_dir,
                notes = root_dir,
              },
              default_workspace = "notes",
            },
          },
          ["core.completion"] = {
            config = {
              engine = "nvim-cmp",
            },
          },
          ["core.journal"] = {
            config = {
              strategy = "flat",
              workspace = "journal",
            },
          },
          ["core.itero"] = {},
          ["core.summary"] = {},
          ["core.export"] = {},
          ["core.export.markdown"] = {
            config = {
              extension = "md",
            },
          },
        },
      }
    end,
  },
}
