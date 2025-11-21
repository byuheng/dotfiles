return {
  'obsidian-nvim/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
  --   -- refer to `:h file-pattern` for more examples
  --   "BufReadPre path/to/my-vault/*.md",
  --   "BufNewFile path/to/my-vault/*.md",
  -- },
  ---@module 'obsidian'
  ---@type obsidian.config
  ui = {
    enable = true,
  },
  opts = {
    -- Workspace configuration
    workspaces = {
      {
        name = 'main',
        path = vim.fn.expand '~/obsidian_vault/',
      },
    },

    -- Attachments outside the vault
    attachments = {
      img_folder = vim.fn.expand '~/Pictures/attachments/images', -- root folder for all attachments
      pdf_folder = vim.fn.expand '~/Pictures/attachments/pdfs',
      video_folder = vim.fn.expand '~/Pictures/attachments/videos',
      audio_folder = vim.fn.expand '~/Pictures/attachments/audio',
      link_style = 'markdown', -- or 'wiki', based on preference
    },

    -- Turn off deprecation warnings and use newer command names
    legacy_commands = false,

    -- Disable frontmatter if you don't want auto-generated YAML
    frontmatter = {
      enabled = false,
    },

    -- Template configuration
    templates = {
      folder = 'resources/templates', -- Template directory relative to vault root
      date_format = '%Y-%m-%d-%a', -- YYYY-MM-DD-Day format for {{date}}
      time_format = '%H:%M:%S', -- 24-hour format for {{time}}

      -- Custom substitutions for template variables
      substitutions = {
        -- Current log files
        curr_monthly_log = (function()
          local y = tonumber(os.date '%Y')
          local m = tonumber(os.date '%m')
          return string.format('%04d%02d', y, m) .. '_monthly_log.md'
        end)(),

        curr_future_log = (function()
          local y = tonumber(os.date '%Y')
          return string.format('%04d', y) .. '_future_log.md'
        end)(),

        -- Previous log files
        prev_daily_log = function()
          return os.date('%Y%m%d', os.time() - 86400) .. '_daily_log.md'
        end,

        prev_weekly_log = function()
          local day_of_week = tonumber(os.date '%w')
          local days_since_monday = (day_of_week + 6) % 7 + 7
          return os.date('%Y%m%d', os.time() - days_since_monday * 86400) .. '_weekly_log.md'
        end,

        prev_rolling_weekly_log = function()
          local day_of_week = tonumber(os.date '%w')
          local days_since_monday = (day_of_week + 6) % 7 + 7
          return os.date('%Y%m%d', os.time() - days_since_monday * 86400) .. '_rolling_weekly_log.md'
        end,

        prev_monthly_log = function()
          local y = tonumber(os.date '%Y')
          local m = tonumber(os.date '%m') - 1
          if m == 0 then
            y = y - 1
            m = 12
          end
          return string.format('%04d%02d', y, m) .. '_monthly_log.md'
        end,

        prev_yearly_log = function()
          local y = tonumber(os.date '%Y') - 1
          return string.format('%04d', y) .. '_yearly_log.md'
        end,

        prev_habit_tracker_log = function()
          local y = tonumber(os.date '%Y')
          local m = tonumber(os.date '%m') - 1
          if m == 0 then
            y = y - 1
            m = 12
          end
          return string.format('%04d%02d', y, m) .. '_habit_tracker_log.md'
        end,

        prev_workout_log = function()
          local day_of_week = tonumber(os.date '%w')
          local days_since_monday = (day_of_week + 6) % 7 + 7
          return os.date('%Y%m%d', os.time() - days_since_monday * 86400) .. '_workout_log.md'
        end,

        prev_weight_tracker_log = function()
          local y = tonumber(os.date '%Y')
          local m = tonumber(os.date '%m') - 1
          if m == 0 then
            y = y - 1
            m = 12
          end
          return string.format('%04d%02d', y, m) .. '_weight_tracker_log.md'
        end,

        -- Previous dates
        prev_day = function()
          return os.date('%Y-%m-%d', os.time() - 86400)
        end,

        prev_week_range = function()
          local day_of_week = tonumber(os.date '%w')
          local days_since_monday = (day_of_week + 6) % 7 + 7
          local monday_time = os.time() - days_since_monday * 86400
          local sunday_time = monday_time + 6 * 86400
          local monday_date = os.date('%Y-%m-%d', monday_time)
          local sunday_date = os.date('%Y-%m-%d', sunday_time)
          return monday_date .. ' to ' .. sunday_date
        end,

        prev_month = function()
          local y = tonumber(os.date '%Y')
          local m = tonumber(os.date '%m') - 1
          if m == 0 then
            y = y - 1
            m = 12
          end
          return string.format('%04d-%02d', y, m)
        end,

        prev_year = function()
          local y = tonumber(os.date '%Y') - 1
          return string.format('%04d-01', y)
        end,

        -- Current dates
        curr_day = function()
          return os.date '%Y-%m-%d'
        end,

        curr_week_range = function()
          local day_of_week = tonumber(os.date '%w')
          local days_since_monday = (day_of_week + 6) % 7
          local monday_time = os.time() - days_since_monday * 86400
          local sunday_time = monday_time + 6 * 86400
          local monday_date = os.date('%Y-%m-%d', monday_time)
          local sunday_date = os.date('%Y-%m-%d', sunday_time)
          return monday_date .. ' to ' .. sunday_date
        end,

        curr_month = function()
          return os.date '%Y-%m'
        end,

        curr_year = function()
          return os.date '%Y'
        end,
      },

      -- Template customizations - controls note placement and ID generation
      -- Keys must match template filenames exactly (without .md extension)
      customizations = {
        ['daily_log_template'] = {
          notes_subdir = 'areas/bujo/daily_log',
          note_id_func = function()
            return os.date '%Y%m%d' .. '_daily_log' -- Creates: 20250827_daily_log
          end,
        },

        ['weekly_log_template'] = {
          notes_subdir = 'areas/bujo/weekly_log',
          note_id_func = function()
            return os.date '%Y%m%d' .. '_weekly_log' -- Creates: 20250827_weekly_log
          end,
        },

        ['rolling_weekly_template'] = {
          notes_subdir = 'areas/bujo/rolling_weekly_log',
          note_id_func = function()
            return os.date '%Y%m%d' .. '_rolling_weekly_log' -- Creates: 20250827_rolling_weekly_log
          end,
        },

        ['monthly_log_template'] = {
          notes_subdir = 'areas/bujo/monthly_log',
          note_id_func = function()
            return os.date '%Y%m' .. '_monthly_log' -- Creates: 202508_monthly_log
          end,
        },

        ['future_log_template'] = {
          notes_subdir = 'areas/bujo/future_log',
          note_id_func = function()
            return os.date '%Y' .. '_future_log' -- Creates: 2025_future_log
          end,
        },

        ['yearly_log_template'] = {
          notes_subdir = 'areas/bujo/yearly_log',
          note_id_func = function()
            return os.date '%Y' .. '_yearly_log' -- Creates: 2025_yearly_log
          end,
        },

        ['habit_tracker_log_template'] = {
          notes_subdir = 'areas/habit_tracker',
          note_id_func = function()
            return os.date '%Y%m' .. '_habit_tracker_log' -- Creates: 202508_habit_tracker_log
          end,
        },

        ['workout_log_template'] = {
          notes_subdir = 'areas/fitness',
          note_id_func = function()
            return os.date '%Y%m%d' .. '_workout_log' -- Creates: 20250827_workout_log
          end,
        },

        ['weight_tracker_log_template'] = {
          notes_subdir = 'areas/fitness',
          note_id_func = function()
            return os.date '%Y%m' .. '_weight_tracker_log' -- Creates: 20250827_weight_tracker_log
          end,
        },
      },
    },

    -- Optional: Configure footer display (shows backlinks, word count, etc.)
    -- footer = {
    --   enabled = false,
    --   separator = false,
    --   format = '{{backlinks}} backlinks  {{words}} words  {{chars}} chars',
    --   hl_group = '@property',
    -- },

    -- Configure how external links open
    -- open = {
    --   use_advanced_uri = true,
    -- },
  },
}
