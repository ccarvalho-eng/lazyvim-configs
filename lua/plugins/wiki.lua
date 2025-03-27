return {
  -- Vimwiki plugin
  {
    "vimwiki/vimwiki",
    lazy = false, -- Important: load at startup
    keys = {
      { "<leader>ww", "<Plug>VimwikiIndex", desc = "Open Vimwiki Index" },
      { "<leader>w<leader>w", "<Plug>VimwikiMakeDiaryNote", desc = "Create Diary Note" },
    },
    init = function()
      -- Get wiki path from environment variable, with a fallback
      local wiki_path = vim.fn.expand("$VIMWIKI_PATH")

      -- If environment variable is not set, use a default
      if wiki_path == "$VIMWIKI_PATH" then
        wiki_path = vim.fn.expand("~/vimwiki/")
      end

      vim.g.vimwiki_list = {
        {
          path = wiki_path,
          syntax = "markdown",
          ext = ".md",
        },
      }

      -- Optional: Prevent vimwiki from taking over all markdown files
      vim.g.vimwiki_global_ext = 0
    end,
  },
}
