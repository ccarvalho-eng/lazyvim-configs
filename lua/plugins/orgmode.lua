return {
  "nvim-orgmode/orgmode",
  event = "VeryLazy",
  ft = { "org" },
  config = function()
    -- Setup orgmode
    local agenda_dir = os.getenv("ORG_AGENDA_FILES")
    require("orgmode").setup({
      org_agenda_files = { agenda_dir .. "/*.org" },
      org_default_notes_file = agenda_dir .. "/notes.org",
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
