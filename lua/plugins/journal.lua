return {
  {
    "jakobkhansen/journal.nvim",
    config = function()
      -- Daily template for reuse
      local daily_template = [[
# %a %d %b %Y

## 🌅 Morning
- [ ] 

## 💪 Goals
- [ ] 

## 📝 Notes

## 🌟 Highlights

## 📊 Progress

## 🌙 Evening Review
- [ ] 
]]

      -- Weekly template function
      local function weekly_template(date)
        local sunday = date:relative({ day = 6 })
        local end_date = os.date("%A %d/%m", os.time(sunday.date))
        return string.format(
          [[
# Week %%W - %%A %%d/%%m -> %s

## 🎯 Weekly Goals
- [ ] 

## 📈 Progress Review

## 🔄 Habits Tracking
- [ ] 

## 📝 Key Notes

## 📅 Next Week Planning
- [ ] 
]],
          end_date
        )
      end

      -- Monthly template
      local monthly_template = [[
# %B %Y

## 🎯 Monthly Goals
- [ ] 

## 📊 Monthly Review
### What Went Well

### What Could Improve

### Lessons Learned

## 📈 Habits Overview

## 🗓️ Key Events

## 📝 Notes

## 🎯 Next Month Planning
]]

      -- Quarterly template function
      local function quarterly_template(date)
        local quarter = math.ceil(os.date("%m", os.time(date.date)) / 3)
        return string.format(
          [[
# %%Y Quarter %d

## 🎯 Quarterly Goals
- [ ] 

## 📊 Quarter Overview
### Achievements

### Challenges

### Opportunities

## 📈 Progress Review

## 💡 Strategic Planning

## 📝 Important Notes

## 🎯 Next Quarter Planning
]],
          quarter
        )
      end

      -- Yearly template
      local yearly_template = [[
# Year %Y

## 🎯 Yearly Goals
- [ ] 

## 🌟 Theme for the Year

## 📊 Year Overview
### Major Achievements

### Key Learnings

### Areas of Growth

## 💫 Memorable Moments

## 📈 Progress Analysis

## 🎯 Next Year Vision
]]

      require("journal").setup({
        filetype = "md",
        root = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Animus/journal",
        date_format = "%a %d %b %Y",
        autocomplete_date_modifier = "end",
        journal = {
          format = "%Y/%m-%B/daily/%d-%A",
          template = daily_template,
          frequency = { day = 1 },
          entries = {
            day = {
              format = "%Y/%m-%B/daily/%d-%A",
              template = daily_template,
              frequency = { day = 1 },
            },
            week = {
              format = "%Y/%m-%B/weekly/week-%W",
              template = weekly_template,
              frequency = { day = 7 },
              date_modifier = "monday",
            },
            month = {
              format = "%Y/%m-%B/%B",
              template = monthly_template,
              frequency = { month = 1 },
            },
            quarter = {
              format = function(date)
                local quarter = math.ceil(tonumber(os.date("%m", os.time(date.date))) / 3)
                return "%Y/quarter/" .. quarter
              end,
              template = quarterly_template,
              frequency = { month = 3 },
            },
            year = {
              format = "%Y/%Y",
              template = yearly_template,
              frequency = { year = 1 },
            },
          },
        },
      })
    end,
  },
}
