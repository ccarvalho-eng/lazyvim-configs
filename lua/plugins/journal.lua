return {
  {
    "jakobkhansen/journal.nvim",
    config = function()
      require("journal").setup({
        root = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Animus/journal",
        journal = {
          entries = {
            -- Entry type for each quarter of the year
            quarter = {
              -- strftime doesn't supply a quarter variable, so we compute it manually
              format = function(date)
                local quarter = math.ceil(tonumber(os.date("%m", os.time(date.date))) / 3)
                return "%Y/quarter/" .. quarter
              end,
              template = function(date)
                local quarter = math.ceil(os.date("%m", os.time(date.date)) / 3)
                return "# %Y Quarter " .. quarter .. "\n"
              end,
              frequency = { month = 3 },
            },
          },
        },
      })
    end,
  },
}
