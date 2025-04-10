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
            -- Switch Test/Implementation
            {
              "<leader>tm",
              function()
                local current_file = vim.fn.expand("%:p")
                local target_file
                local is_test_file = false

                if current_file:match("_test%.exs$") then
                  -- We're in a test file, switch to implementation
                  target_file = current_file:gsub("/test/", "/lib/"):gsub("_test%.exs$", ".ex")
                  is_test_file = false
                elseif current_file:match("%.ex$") then
                  -- We're in an implementation file, switch to test
                  target_file = current_file:gsub("/lib/", "/test/"):gsub("%.ex$", "_test.exs")
                  is_test_file = true
                else
                  print("Not a recognized Elixir file type")
                  return
                end

                if vim.fn.filereadable(target_file) == 1 then
                  vim.cmd("edit " .. target_file)
                else
                  -- Create directory if it doesn't exist
                  local target_dir = vim.fn.fnamemodify(target_file, ":h")
                  if vim.fn.isdirectory(target_dir) == 0 then
                    vim.fn.mkdir(target_dir, "p")
                  end

                  -- Create and open the new file
                  vim.cmd("edit " .. target_file)

                  if is_test_file then
                    -- Extract full module path from the implementation file path
                    local rel_path = current_file:match(".*/lib/(.+)%.ex$")
                    if rel_path then
                      -- Convert path to module name
                      local module_name = rel_path
                        :gsub("/", ".")
                        :gsub("_(%l)", function(l)
                          return l:upper()
                        end) -- convert snake_case to camelCase
                        :gsub("^%l", string.upper) -- capitalize first letter
                        :gsub("%.%l", string.upper) -- capitalize letters after dots

                      -- Generate test module content
                      local test_content = string.format(
                        [[
defmodule %sTest do
  use ExUnit.Case
  doctest %s

  test "greets the world" do
    assert true
  end
end]],
                        module_name,
                        module_name
                      )

                      -- Insert the test module content
                      vim.api.nvim_buf_set_lines(0, 0, -1, false, vim.split(test_content, "\n"))

                      -- Save the file
                      vim.cmd("write")
                    end
                  end
                end
              end,
              desc = "Switch Test/Implementation",
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
        nls.builtins.diagnostics.credo.with({
          condition = function(utils)
            return utils.root_has_file(".credo.exs")
          end,
        }),
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
    },
    config = function()
      vim.g["test#strategy"] = "neovim"
      vim.g["test#neovim#term_position"] = "vert"
      -- vim.g["test#elixir#exunit#options"] = "--trace"
    end,
  },
}
