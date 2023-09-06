require "base"
require "highlights"
require "maps"
require "macos"
require "plugins"

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

autocmd("TextYankPost", {
  group = yank_group,
  pattern = "*",
  callback = function()
    vim.highlight.on_yank {
      higroup = "IncSearch",
      timeout = 40,
    }
  end,
})

vim.cmd "colorscheme codedark"
vim.cmd "set foldmethod=indent"
vim.cmd "set foldlevel=99"
