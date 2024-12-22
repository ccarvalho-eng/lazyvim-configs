return {
  {
    "jakobkhansen/journal.nvim",
    config = function()
      -- Daily template with enhanced structure
      local daily_template = [[
# %a %d %b %Y

## 🌅 Morning Routine
- [ ] Review today's calendar and priorities
- [ ] Plan top 3 tasks for the day
- [ ] Check energy levels (1-10): 

## 💪 Today's Goals
### Must Do
- [ ] 

### Should Do
- [ ] 

### Nice to Do
- [ ] 

## 📝 Notes & Ideas
<!-- Capture thoughts, ideas, and insights throughout the day -->

## 🤝 Interactions
<!-- Key meetings, conversations, and collaborations -->

## 🎯 Progress Tracking
### What Went Well
- 

### Challenges Faced
- 

### Solutions/Learnings
- 

## 🌟 Today's Highlights
<!-- Memorable moments and key achievements -->

## 🌙 Evening Review
### Accomplished Today
- [ ] 

### Energy Level End of Day (1-10): 

### Tomorrow's Preparation
- [ ] Key tasks to tackle
- [ ] Schedule adjustments needed

### Gratitude
Three things I'm grateful for:
1. 
2. 
3. 
]]

      -- Weekly template function with improved structure
      local function weekly_template(date)
        local sunday = date:relative({ day = 6 })
        local end_date = os.date("%A %d/%m", os.time(sunday.date))
        return string.format(
          [[
# Week %%W - %%A %%d/%%m -> %s

## 🎯 Weekly Goals & Focus Areas
### Professional Goals
- [ ] 

### Personal Goals
- [ ] 

### Learning Goals
- [ ] 

## 📈 Progress Review
### Key Wins
- 

### Challenges & Solutions
- 

### Unfinished Tasks
- 

## 🔄 Habits Tracking
### Daily Habits
| Habit | Mon | Tue | Wed | Thu | Fri | Sat | Sun |
|-------|-----|-----|-----|-----|-----|-----|-----|
|       |     |     |     |     |     |     |     |

### Weekly Metrics
- Energy Level (Avg): 
- Productivity Score (1-10): 
- Work-Life Balance (1-10): 

## 📝 Key Learnings & Insights
<!-- Important realizations and learnings from the week -->

## 🌟 Memorable Moments
<!-- Highlight special moments or achievements -->

## 📅 Next Week Planning
### Focus Areas
- 

### Key Appointments
- 

### Tasks to Delegate
- 
]],
          end_date
        )
      end

      -- Monthly template with comprehensive review structure
      local monthly_template = [[
# %B %Y

## 🎯 Monthly Goals
### Professional Development
- [ ] 

### Personal Growth
- [ ] 

### Health & Wellness
- [ ] 

### Relationships
- [ ] 

## 📊 Monthly Review
### Major Achievements
- 

### Growth Areas
- 

### Challenges Overcome
- 

### Lessons Learned
- 

## 📈 Habits & Metrics
### Habit Completion Rates
<!-- Track completion rates of key habits -->

### Key Performance Indicators
- Professional Goals Progress: 
- Personal Goals Progress: 
- Health Goals Progress: 

## 🗓️ Key Events & Milestones
<!-- Important dates, achievements, and memorable moments -->

## 💰 Financial Review
### Budget Overview
- Income: 
- Expenses: 
- Savings: 

### Financial Goals Progress
- [ ] 

## 📝 Notes & Insights
<!-- Important learnings and observations -->

## 🎯 Next Month Planning
### Focus Areas
- 

### Goals to Carry Forward
- 

### New Initiatives
- 
]]

      -- Quarterly template function with strategic focus
      local function quarterly_template(date)
        local quarter = math.ceil(os.date("%m", os.time(date.date)) / 3)
        return string.format(
          [[
# %%Y Quarter %d

## 🎯 Quarterly Goals & OKRs
### Objectives
1. 
2. 
3. 

### Key Results
1. 
2. 
3. 

## 📊 Quarter Overview
### Major Accomplishments
- 

### Challenges & Solutions
- 

### Opportunities Identified
- 

## 📈 Performance Review
### Goals Progress
- Goal 1: [ ] Progress %
- Goal 2: [ ] Progress %
- Goal 3: [ ] Progress %

### Metrics Dashboard
<!-- Key metrics and their trends -->

## 💡 Strategic Planning
### Strengths to Leverage
- 

### Areas for Improvement
- 

### Action Items
- [ ] 

## 📝 Important Learnings
<!-- Key insights and knowledge gained -->

## 🎯 Next Quarter Planning
### Strategic Priorities
- 

### Resource Requirements
- 

### Risk Assessment
- 
]],
          quarter
        )
      end

      -- Yearly template with comprehensive life review
      local yearly_template = [[
# Year %Y

## 🎯 Yearly Goals & Vision
### Professional
- [ ] 

### Personal
- [ ] 

### Financial
- [ ] 

### Health & Wellness
- [ ] 

### Relationships
- [ ] 

## 🌟 Theme for the Year
<!-- One word or phrase to capture the year's focus -->

## 📊 Year in Review
### Major Achievements
- 

### Key Projects Completed
- 

### Learning & Growth
- 

### Challenges Overcome
- 

## 💫 Memorable Moments
### Highlights by Quarter
Q1: 
Q2: 
Q3: 
Q4: 

### Personal Milestones
- 

## 📈 Progress Analysis
### Goals Achievement Rate
- Professional: %
- Personal: %
- Financial: %
- Health: %
- Relationships: %

### Habit Development
<!-- Review of habit formation and maintenance -->

## 🎯 Next Year Vision
### Long-term Goals (3-5 years)
- 

### Focus Areas for Next Year
- 

### Personal Development Plan
- 

### Resource Planning
- 
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
