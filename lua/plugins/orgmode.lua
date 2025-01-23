return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    require("orgmode").setup({
      org_agenda_files = os.getenv("ORG_AGENDA_FILES") .. "/**/*",
      org_agenda_default_notes_file = os.getenv("ORG_DEFAULT_NOTES_FILE"),
    })

    require("nvim-treesitter.configs").setup({
      ensure_installed = "all",
      ignore_install = { "org" },
      -- Add missing required fields
      modules = {},
      sync_install = false,
      auto_install = true,
    })
  end,
}
