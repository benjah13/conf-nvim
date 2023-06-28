local status, bufferline = pcall(require, "bufferline")
if not status then
  return
end

-- local mocha = require("catppuccin.palettes").get_palette "mocha"

bufferline.setup {
  -- highlights = require("catppuccin.groups.integrations.bufferline").get {
  -- 	styles = { "italic", "bold" },
  -- 	custom = {
  -- 		all = {
  -- 			fill = { bg = "#000000" },
  -- 		},
  -- 		mocha = {
  -- 			background = { fg = mocha.text },
  -- 		},
  -- 		latte = {
  -- 			background = { fg = "#000000" },
  -- 		},
  -- 	},
  -- },
  options = {
    mode = "tabs",
    -- separator_style = 'slant',
    always_show_bufferline = false,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true,
  },
  -- highlights = {
  --   separator = {
  --     fg = '#073642',
  --     bg = '#002b36',
  --   },
  --   separator_selected = {
  --     fg = '#073642',
  --   },
  --   background = {
  --     fg = '#657b83',
  --     bg = '#002b36'
  --   },
  --   buffer_selected = {
  --     fg = '#fdf6e3',
  --     bold = true,
  --   },
  --   fill = {
  --     bg = '#073642'
  --   }
  -- },
}

vim.keymap.set("n", "<S-l>", "<Cmd>BufferLineCycleNext<CR>", {})
vim.keymap.set("n", "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", {})
