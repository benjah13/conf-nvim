vim.g.barbar_auto_setup = false -- disable auto-setup

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

require("barbar").setup {}

map("n", "<C-,>", "<Cmd>BufferPrevious<CR>", opts)
map("n", "<C-.>", "<Cmd>BufferNext<CR>", opts)
