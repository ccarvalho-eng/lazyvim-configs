return {
  {
    "jakobkhansen/journal.nvim",
    config = function()
      require("journal").setup({
        filetype = "md",
        root = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Animus/journal",
        date_format = "%a %d %b %Y",
        autocomplete_date_modifier = "end",
        journal = {
          format = "%Y/%m-%B/daily/%d-%A",
          template = "# %a %d %b %Y\n",
          frequency = { day = 1 },
          entries = {
            day = {
              format = "%Y/%m-%B/daily/%d-%A",
              template = "# %a %d %b %Y\n",
              frequency = { day = 1 },
            },
            week = {
              format = "%Y/%m-%B/weekly/week-%W",
              template = function(date)
                local sunday = date:relative({ day = 6 })
                local end_date = os.date("%A %d/%m", os.time(sunday.date))
                return "# Week %W - %A %d/%m -> " .. end_date .. "\n"
              end,
              frequency = { day = 7 },
              date_modifier = "monday",
            },
            month = {
              format = "%Y/%m-%B/%B",
              template = "# %B %Y\n",
              frequency = { month = 1 },
            },
            year = {
              format = "%Y/%Y",
              template = "# %Y\n",
              frequency = { year = 1 },
            },
            quarter = {
              format = function(date)
                local quarter = math.ceil(tonumber(os.date("%m", os.time(date.date))) / 3)
                return "%Y/quarter/" .. quarter
              end,
              template = function(date)
                local quarter = math.ceil(os.date("%m", os.time(date.date)) / 3)
                return "# %Y Quarter " .. quarter .. " - " .. os.date("%a %d %b %Y", os.time(date.date)) .. "\n"
              end,
              frequency = { month = 3 },
            },
          },
        },
      })
    end,
  },
}
