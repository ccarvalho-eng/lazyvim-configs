return {
  "ahmedkhalf/project.nvim",
  dependencies = {
    "ibhagwan/fzf-lua",
  },
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
    local history = require("project_nvim.utils.history")
    history.delete_project = function(project)
      for k, v in pairs(history.recent_projects) do
        if v == project.value then
          history.recent_projects[k] = nil
          return
        end
      end
    end
    LazyVim.on_load("fzf-lua.nvim", function()
      require("fzf-lua").load_extension("projects")
    end)
  end,
}
