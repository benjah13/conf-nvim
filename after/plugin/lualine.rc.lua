-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require('lualine')

-- Color table for highlights
-- stylua: ignore
local colors = {
  bg       = '#202328',
  fg       = '#bbc2cf',
  yellow   = '#ECBE7B',
  cyan     = '#008080',
  darkblue = '#081633',
  green    = '#98be65',
  orange   = '#FF8800',
  violet   = '#a9a1e1',
  magenta  = '#c678dd',
  blue     = '#51afef',
  red      = '#ec5f67',
}

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand('%:t')) ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = '',
    section_separators = '',
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = { c = { fg = colors.fg, bg = colors.bg } },
      inactive = { c = { fg = colors.fg, bg = colors.bg } },
    },
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {},
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {},
  },
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x at right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end



ins_left {
  -- mode component
 'mode', 
  color = function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red,
    }
    return { bg = mode_color[vim.fn.mode()] }
  end,
  padding = { left = 1, right = 1 },
}

ins_left {
  'filename',
  cond = conditions.buffer_not_empty,
  path = 1,
  color = { fg = colors.magenta, gui = 'bold' },
}

ins_left { 'location' }

ins_left { 'progress', color = { fg = colors.fg, gui = 'bold' } }

ins_left {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  symbols = { error = ' ', warn = ' ', info = ' ' },
  diagnostics_color = {
    color_error = { fg = colors.red },
    color_warn = { fg = colors.yellow },
    color_info = { fg = colors.cyan },
  },
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {
  function()
    return '%='
  end,
}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = { fg = '#ffffff', gui = 'bold' },
}



ins_right {
  'branch',
  icon = '',
  color = { fg = colors.violet, gui = 'bold' },
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = { added = ' ', modified = '󰝤 ', removed = ' ' },
  diff_color = {
    added = { fg = colors.green },
    modified = { fg = colors.orange },
    removed = { fg = colors.red },
  },
  cond = conditions.hide_in_width,
}

-- Now don't forget to initialize lualine
lualine.setup(config)

--
-- local status, lualine = pcall(require, "lualine")
-- if not status then
--   return
-- end
--
-- lualine.setup {
--   options = {
--     icons_enabled = true,
--     theme = "auto",
--     section_separators = "",
--     component_separators = "",
--     disabled_filetypes = {},
--   },
--   sections = {
--     lualine_a = { "mode" },
--     lualine_b = { "branch" },
--     lualine_c = {
--       {
--         "filename",
--         file_status = true, -- displays file status (readonly status, modified status)
--         path = 2, -- 0 = just filename, 1 = relative path, 2 = absolute path
--       },
--     },
--     lualine_x = {
--       'diagnostics',
--
--       -- Table of diagnostic sources, available sources are:
--       --   'nvim_lsp', 'nvim_diagnostic', 'nvim_workspace_diagnostic', 'coc', 'ale', 'vim_lsp'.
--       -- or a function that returns a table as such:
--       --   { error=error_cnt, warn=warn_cnt, info=info_cnt, hint=hint_cnt }
--       sources = { 'nvim_lsp', 'nvim_diagnostic' },
--
--       -- Displays diagnostics for the defined severity types
--       sections = { 'error', 'warn', 'info', 'hint' },
--
--       diagnostics_color = {
--         -- Same values as the general color option can be used here.
--         error = 'DiagnosticError', -- Changes diagnostics' error color.
--         warn  = 'DiagnosticWarn',  -- Changes diagnostics' warn color.
--         info  = 'DiagnosticInfo',  -- Changes diagnostics' info color.
--         hint  = 'DiagnosticHint',  -- Changes diagnostics' hint color.
--       },
--       symbols = {error = 'E', warn = 'W', info = 'I', hint = 'H'},
--       colored = true,           -- Displays diagnostics status in color if set to true.
--       update_in_insert = false, -- Update diagnostics in insert mode.
--       always_visible = true,   -- Show diagnostics even if there are none.
--     }, 
--     lualine_y = { "progress" },
--     lualine_z = { "location" },
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {
--       {
--         "filename",
--         file_status = true, -- displays file status (readonly status, modified status)
--         path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
--       },
--     },
--     lualine_x = { "location" },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {},
--   extensions = { "fugitive" },
-- }
