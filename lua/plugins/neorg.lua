return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = "Neorg",
    ft = "norg",
    opts = function()
      local root_dir = os.getenv("NEORG_NOTES")
      return {
        load = {
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.syntax"] = {},
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
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "norg" },
        sync_install = false, -- Install parsers synchronously (only applied to `ensure_installed`)
        ignore_install = {}, -- List of parsers to ignore installing
        auto_install = true, -- Automatically install missing parsers when entering buffer
        highlight = {
          enable = true,
        },
        modules = {}, -- Additional modules configuration
      })
    end,
  },
}
