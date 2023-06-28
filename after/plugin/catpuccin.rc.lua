vim.g.catppuccin_flavour = "macchiato" -- latte, frappe, macchiato, mocha

local colors = require("catppuccin.palettes").get_palette()
colors.none = "NONE"

require("catppuccin").setup {
  transparent_background = false,
  term_colors = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin",
  },
  dim_inactive = {
    enabled = true,
    shade = "dark",
    percentage = 0.15,
  },
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    gitgutter = true,
    mason = true,
    treesitter = true,
    treesitter_context = true,
    telescope = true,
  },
  color_overrides = {},
  highlight_overrides = {},
  custom_highlights = {
    Comment = { fg = colors.overlay1 },
    LineNr = { fg = colors.overlay1 },
    CursorLine = { bg = colors.none },
    CursorLineNr = { fg = colors.lavender },
    DiagnosticVirtualTextError = { bg = colors.none },
    DiagnosticVirtualTextWarn = { bg = colors.none },
    DiagnosticVirtualTextInfo = { bg = colors.none },
    DiagnosticVirtualTextHint = { bg = colors.none },
  },
}

-- vim.cmd [[colorscheme catppuccin-latte]]
