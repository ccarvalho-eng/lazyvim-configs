return {
  "ahmedkhalf/project.nvim",
  opts = {
    detection_methods = { "pattern" },
    patterns = {
      ".git",
      "_darcs",
      ".hg",
      ".bzr",
      ".svn",
      "Makefile",
      "package.json",
      -- Elixir
      "mix.exs",
      -- Erlang
      "rebar.config",
      "erlang.mk",
      -- Gleam
      "gleam.toml",
      -- Python
      "setup.py",
      "pyproject.toml",
      "requirements.txt",
      -- Rust
      "Cargo.toml",
    },
    ignore_lsp = {},
    exclude_dirs = {},
    show_hidden = false,
    silent_chdir = true,
    scope_chdir = "global",
    datapath = vim.fn.stdpath("data"),
    manual_mode = false,
    projects = {
      "~/Projects/*",
    },
  },
  config = function(_, opts)
    require("project_nvim").setup(opts)
    require("telescope").load_extension("projects")
  end,
}
