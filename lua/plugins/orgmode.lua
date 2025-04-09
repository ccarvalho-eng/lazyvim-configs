return {
  {
    "nvim-orgmode/orgmode",
    event = "VeryLazy",
    ft = { "org" },
    config = function()
      local agenda_dir = os.getenv("ORG_AGENDA_FILES")
      local journal_dir = agenda_dir .. "/journal"

      -- Create journal directory if it doesn't exist
      if vim.fn.isdirectory(journal_dir) == 0 then
        vim.fn.mkdir(journal_dir, "p")
      end

      require("orgmode").setup({
        org_agenda_files = { agenda_dir .. "/*/*.org" },
        org_default_notes_file = agenda_dir .. "/notes.org",

        -- Configure journal settings
        org_journal = {
          dir = journal_dir,
          date_pattern = "%Y-%m-%d",
          file_pattern = "%Y-%m-%d.org",
        },
      })

      -- Function to create journal template
      local function create_journal_template(date)
        local template = {
          "#+TITLE: Journal Entry " .. date,
          "#+DATE: [" .. date .. "]",
          "",
          "* Morning Routine [/]",
          "** TODO Water",
          "** TODO Exercise",
          "** TODO Meditation",
          "** TODO Breakfast",
          "** TODO Reading",
          "** TODO House Chores",
          "",
          "* Inbox",
          "** TODO Slack",
          "** TODO Gmail",
          "** TODO Google Calendar",
          "** TODO GitHub",
          "** TODO Linear",
          "",
          "* Tasks [/]",
          "** TODO ",
          "",
          "* Notes",
          "**",
          "",
          "* Learnings",
          "** ",
          "",
        }
        return table.concat(template, "\n")
      end

      -- Function to open today's journal
      local function open_today_journal()
        local date = os.date("%Y-%m-%d")
        local file_path = journal_dir .. "/" .. date .. ".org"

        -- Create file if it doesn't exist
        if vim.fn.filereadable(file_path) == 0 then
          local file = io.open(file_path, "w")
          if file then
            file:write(create_journal_template(date))
            file:close()
          end
        end

        vim.cmd("edit " .. file_path)
      end

      -- Function to create tomorrow's journal
      local function create_tomorrow_journal()
        local tomorrow = os.date("%Y-%m-%d", os.time() + 86400)
        local file_path = journal_dir .. "/" .. tomorrow .. ".org"

        if vim.fn.filereadable(file_path) == 0 then
          local file = io.open(file_path, "w")
          if file then
            file:write(create_journal_template(tomorrow))
            file:close()
          end
          vim.notify("Created tomorrow's journal entry", vim.log.levels.INFO)
        else
          vim.notify("Tomorrow's journal already exists", vim.log.levels.WARN)
        end
      end

      -- Keymaps
      vim.keymap.set("n", "<Leader>on", function()
        vim.cmd("Ex " .. os.getenv("ORG_DEFAULT_NOTES_FILE"))
      end, { desc = "Open org notes directory" })

      vim.keymap.set("n", "<Leader>oj", function()
        vim.cmd("Ex " .. journal_dir)
      end, { desc = "Open journal directory" })

      vim.keymap.set("n", "<Leader>ot", open_today_journal, { desc = "Open today's journal" })

      vim.keymap.set("n", "<Leader>oT", create_tomorrow_journal, { desc = "Create tomorrow's journal" })

      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "org" },
        modules = {},
        sync_install = false,
        auto_install = true,
      })
    end,
  },
  {
    "akinsho/org-bullets.nvim",
    ft = { "org" },
    config = function()
      require("org-bullets").setup()
    end,
  },
  {
    "dhruvasagar/vim-table-mode",
    ft = { "org" },
    config = function()
      vim.g.table_mode_map_prefix = "<leader>tm"
      vim.g.table_mode_corner = "+"
    end,
  },
}
