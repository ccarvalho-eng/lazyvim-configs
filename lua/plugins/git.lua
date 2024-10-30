return {
  {
    "tpope/vim-fugitive",
    cmd = "Git",
    keys = {
      { "<leader>gt", ":.GBrowse<CR>", desc = "Open current line on GithHub" },
    },
  },
  {
    "tpope/vim-rhubarb",
    dependencies = { "tpope/vim-fugitive" },
  },
}
