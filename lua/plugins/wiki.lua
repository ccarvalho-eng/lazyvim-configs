return {
  "vimwiki/vimwiki",
  event = "BufEnter *.md",
  keys = { "<leader>ww", "<leader>wt" },
  init = function()
    vim.g.vimwiki_list = {
      {
        path = "~/Library/Mobile Documents/com~apple~CloudDocs/vimwiki/",
        syntax = "markdown",
        ext = "md",
      },
    }
  end,
}