return {
  "vimwiki/vimwiki",
  event = "BufEnter *.md",
  keys = {
    { "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "VimWiki Index" },
    { "<leader>wt", "<cmd>VimwikiTabIndex<cr>", desc = "VimWiki Tab Index" },
    { "<leader>wi", "<cmd>VimwikiDiaryIndex<cr>", desc = "VimWiki Diary Index" },
    { "<leader>w<leader>w", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "VimWiki Make Diary Note" },
    { "<leader>w<leader>t", "<cmd>VimwikiTabMakeDiaryNote<cr>", desc = "VimWiki Tab Make Diary Note" },
    -- Custom time period entries
    {
      "<leader>wdw",
      function()
        require("plugins.vimwiki.utils").weekly_note()
      end,
      desc = "Weekly Note",
    },
    {
      "<leader>wdm",
      function()
        require("plugins.vimwiki.utils").monthly_note()
      end,
      desc = "Monthly Note",
    },
    {
      "<leader>wdq",
      function()
        require("plugins.vimwiki.utils").quarterly_note()
      end,
      desc = "Quarterly Note",
    },
    {
      "<leader>wdy",
      function()
        require("plugins.vimwiki.utils").yearly_note()
      end,
      desc = "Yearly Note",
    },
    -- Custom diary entries
    {
      "<leader>wdd",
      function()
        require("plugins.vimwiki.utils").daily_diary()
      end,
      desc = "Daily Diary (Full)",
    },
    {
      "<leader>wdz",
      function()
        require("plugins.vimwiki.utils").quick_diary()
      end,
      desc = "Daily Diary (Quick)",
    },
    {
      "<leader>wdt",
      function()
        require("plugins.vimwiki.utils").diary_with_time()
      end,
      desc = "Diary with Time Entry",
    },
  },
  init = function()
    vim.g.vimwiki_list = {
      {
        path = os.getenv("VIMWIKI_PATH"),
        syntax = "markdown",
        ext = ".md",
        diary_rel_path = "journal/",
      },
    }
    vim.g.vimwiki_key_mappings = {
      html = 0, -- This disables all HTML-related mappings including <leader>wh
    }
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_autowriteall = 1
    vim.g.vimwiki_use_calendar = 1
  end,
}
