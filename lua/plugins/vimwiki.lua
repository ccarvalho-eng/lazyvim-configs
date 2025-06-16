return {
  "vimwiki/vimwiki",
  event = "BufEnter *.md",
  keys = {
    { "<leader>ww", "<cmd>VimwikiIndex<cr>", desc = "VimWiki Index" },
    { "<leader>wt", "<cmd>VimwikiTabIndex<cr>", desc = "VimWiki Tab Index" },
    { "<leader>ws", "<cmd>VimwikiUISelect<cr>", desc = "VimWiki Select" },
    { "<leader>wi", "<cmd>VimwikiDiaryIndex<cr>", desc = "VimWiki Diary Index" },
    { "<leader>w<leader>w", "<cmd>VimwikiMakeDiaryNote<cr>", desc = "VimWiki Make Diary Note" },
    { "<leader>w<leader>t", "<cmd>VimwikiTabMakeDiaryNote<cr>", desc = "VimWiki Tab Make Diary Note" },
  },
  init = function()
    vim.g.vimwiki_list = {
      {
        path = os.getenv("VIMWIKI_PATH"),
        syntax = "markdown",
        ext = ".md",
      },
    }
    vim.g.vimwiki_global_ext = 0
    vim.g.vimwiki_markdown_link_ext = 1
    vim.g.vimwiki_autowriteall = 1

    -- Disable the default key mappings to avoid conflicts
    vim.g.vimwiki_key_mappings = {
      html = 0, -- This disables all HTML-related mappings including <leader>wh
    }
  end,
}
