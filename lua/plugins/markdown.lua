return {
  -- Treesitter for Markdown
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },

  -- Ensure necessary tools are installed
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "markdownlint-cli2", "markdown-toc" })
    end,
  },

  -- Configure LSP for Markdown
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },

  -- Markdown rendering
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown", "norg", "rmd", "org" },
    opts = {
      code = { sign = false, width = "block", right_pad = 1 },
      heading = { sign = false, icons = {} },
    },
    config = function(_, opts)
      require("render-markdown").setup(opts)
      LazyVim.toggle.map("<leader>um", {
        name = "Render Markdown",
        get = function()
          return require("render-markdown.state").enabled
        end,
        set = function(enabled)
          local m = require("render-markdown")
          if enabled then
            m.enable()
          else
            m.disable()
          end
        end,
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2", "markdown-toc" },
      },
      formatters = {
        ["markdown-toc"] = {
          condition = function(_, ctx)
            return vim.tbl_contains(vim.api.nvim_buf_get_lines(ctx.buf, 0, -1, false), "<!-- toc -->")
          end,
        },
        ["markdownlint-cli2"] = {
          condition = function(_, ctx)
            return #vim.tbl_filter(function(d)
              return d.source == "markdownlint"
            end, vim.diagnostic.get(ctx.buf)) > 0
          end,
        },
      },
    },
  },

  -- Linting
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = { "markdownlint-cli2" },
      },
    },
  },

  -- Additional Markdown-specific settings
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "markdown_inline" })
      end
    end,
  },

  -- Markdown-specific keymaps and settings
  {
    "nvim-lua/plenary.nvim",
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function()
          vim.opt_local.wrap = true
          vim.opt_local.spell = true
          vim.opt_local.tabstop = 2
          vim.opt_local.shiftwidth = 2
          vim.opt_local.conceallevel = 2

          -- Easy table creation
          vim.keymap.set("i", "<leader>|", "<Esc>:TableModeToggle<CR>a", { buffer = true, desc = "Toggle Table Mode" })

          -- Toggle checkbox
          vim.keymap.set("n", "<leader>x", function()
            local line = vim.api.nvim_get_current_line()
            local new_line = line:gsub("^(%s*-?%s*%[)([%s|x])(%])", function(start, check, finish)
              return start .. (check == " " and "x" or " ") .. finish
            end)
            vim.api.nvim_set_current_line(new_line)
          end, { buffer = true, desc = "Toggle Checkbox" })
        end,
      })
    end,
  },
}
