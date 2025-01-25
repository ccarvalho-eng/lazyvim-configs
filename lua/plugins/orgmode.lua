return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      local agenda_dir = os.getenv("ORG_AGENDA_FILES")
      require("orgmode").setup({
        org_agenda_files = { agenda_dir .. "/*.org" },
        org_default_notes_file = agenda_dir .. "/notes.org",
      })

      -- Add a keybinding to open org files directory
      vim.keymap.set("n", "<Leader>on", function()
        vim.cmd("Ex " .. os.getenv("ORG_AGENDA_FILES"))
      end, { desc = "Open org notes directory" })

      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "org" },
        modules = {},
        sync_install = false,
        auto_install = true,
      })
    end,
  },
  {
    "akinsho/org-bullets.nvim",
    ft = { "org" },
    config = function()
      require("org-bullets").setup()
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = { "org" },
    config = function()
      vim.g.table_mode_map_prefix = "<leader>tm"
      vim.g.table_mode_corner = "+"
    end,
  },
}
