-- Elixir Language Server and Plugin Configuration for LazyVim
return {
  -- LSP Configuration for Elixir
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        elixirls = {
          -- ElixirLS Pipe Manipulation Keybindings
          keys = {
            -- Convert to Pipe
            {
              "<leader>cp",
              function()
                local params = vim.lsp.util.make_position_params(0, "utf-8")
                LazyVim.lsp.execute({
                  command = "manipulatePipes:serverid",
                  arguments = { "toPipe", params.textDocument.uri, params.position.line, params.position.character },
                })
              end,
              desc = "Convert to Pipe",
            },
            -- Convert from Pipe
            {
              "<leader>cP",
              function()
                local params = vim.lsp.util.make_position_params(0, "utf-8")
                LazyVim.lsp.execute({
                  command = "manipulatePipes:serverid",
                  arguments = { "fromPipe", params.textDocument.uri, params.position.line, params.position.character },
                })
              end,
              desc = "Convert from Pipe",
            },
            -- Append |> dbg()
            {
              "<leader>cI",
              function()
                local line = vim.api.nvim_get_current_line()
                local new_line = line .. " |> dbg()"
                vim.api.nvim_set_current_line(new_line)
              end,
              desc = "Append |> dbg()",
            },
          },
        },
      },
    },
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

  -- Optional: Neotest configuration with Elixir adapter
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["neotest-elixir"] = {},
      },
    },
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
  },

  -- Credo Integration using Null-LS for Linting
  {
    "nvimtools/none-ls.nvim", -- Using the community fork instead of jose-elias-alvarez/null-ls.nvim
    opts = function(_, opts)
      local nls = require("null-ls") -- The require name remains "null-ls" for API compatibility
      opts.sources = vim.list_extend(opts.sources or {}, {
        -- Linting with Credo
        nls.builtins.diagnostics.credo.with({
          condition = function(utils)
            return utils.root_has_file(".credo.exs")
          end,
        }),
        -- Formatting with Mix format
        nls.builtins.formatting.mix,
      })
    end,
  },

  -- Optional: Credo Linting using nvim-lint
  {
    "mfussenegger/nvim-lint",
    opts = function(_, opts)
      opts.linters_by_ft = {
        elixir = { "credo" },
      }
      opts.linters = {
        credo = {
          condition = function(ctx)
            return vim.fs.find({ ".credo.exs" }, { path = ctx.filename, upward = true })[1]
          end,
        },
      }
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
          require("plugins.elixir.utils").switch_test_implementation()
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
