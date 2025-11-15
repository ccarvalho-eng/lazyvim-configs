-- Elixir Language Server and Plugin Configuration for LazyVim

return {
  -- LSP Configuration for Elixir
  {
    "neovim/nvim-lspconfig",
    ft = { "elixir", "heex", "eex" },
    opts = {
      servers = {
        elixirls = {
          cmd = { vim.fn.expand("~/.elixir-ls/release/language_server.sh") },
          filetypes = { "elixir", "eelixir", "heex" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern("mix.exs", ".git")(fname)
          end,
          settings = {
            elixirLS = {
              dialyzerEnabled = false,
              fetchDeps = false,
            },
          },
        },
      },
    },
    config = function(_, opts)
      -- Setup keybinding for Elixir debugging
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "elixir", "heex", "eex" },
        callback = function()
          vim.api.nvim_buf_set_keymap(
            0,
            "n",
            "<leader>cD",
            ":lua vim.api.nvim_set_current_line(vim.api.nvim_get_current_line() .. ' |> dbg()')<CR>",
            { noremap = true, silent = true, desc = "Append |> dbg() to current line" }
          )
        end,
      })
    end,
  },

  -- Treesitter Configuration for Elixir and Related Languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "elixir", "heex", "eex" },
    },
  },

  -- Neotest Adapter for Elixir
  {
    "jfpedroza/neotest-elixir",
  },

  -- Neotest configuration with Elixir adapter
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-elixir"] = {
          -- Allow test_helper.exs files
          test_file_pattern = ".*%.exs$",
        },
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Credo Integration using none-ls (configured via LazyVim extra)
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local ok, nls = pcall(require, "none-ls")
      if not ok then
        return opts
      end

      opts.sources = opts.sources or {}
      opts.sources = vim.list_extend(opts.sources, {
        -- Linting with Credo
        nls.builtins.diagnostics.credo.with({
          condition = function(utils)
            return utils.root_has_file(".credo.exs")
          end,
        }),
        -- Formatting with Mix format
        nls.builtins.formatting.mix,
      })

      return opts
    end,
  },

  -- vim-test configuration
  {
    "vim-test/vim-test",
    keys = {
      { "<leader>m", desc = "+Mix Tasks" },
      { "<leader>mt", desc = "+Tests" },
      { "<leader>mts", "<cmd>TestNearest<CR>", desc = "Run nearest test" },
      { "<leader>mtv", "<cmd>TestFile<CR>", desc = "Run test file" },
      { "<leader>mta", "<cmd>TestSuite<CR>", desc = "Run test suite" },
      { "<leader>mtr", "<cmd>TestLast<CR>", desc = "Run last test" },
      { "<leader>mtf", "<cmd>TestVisit<CR>", desc = "Visit test file" },
      {
        "<leader>mti",
        function()
          local ok, utils = pcall(require, "plugins.elixir.utils")
          if ok then
            utils.switch_test_implementation()
          else
            vim.notify("Failed to load elixir utils", vim.log.levels.ERROR)
          end
        end,
        desc = "Visit implementation file",
      },
    },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "vert"
      -- vim.g["test#elixir#exunit#options"] = "--trace"
    end,
  },
}
