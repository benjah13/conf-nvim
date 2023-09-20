local trouble = require "trouble.providers.telescope"
local status, telescope = pcall(require, "telescope")
if not status then
  return
end
local actions = require "telescope.actions"
local builtin = require "telescope.builtin"

local function telescope_buffer_dir()
  return vim.fn.expand "%:p:h"
end

telescope.setup {
  pickers = {
    colorscheme = {
      enable_preview = true,
    }
  },
  defaults = {
    path_display = { "truncate" },
    file_ignore_patterns = {
      "node_modules",
      "build",
      "dist",
      "yarn.lock",
      ".git/",
      ".next",
    },
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
      n = {
        ["q"] = actions.close,
      },
    },
  },
  extensions = {
    fzf = {
      fuzzy = true, -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true, -- override the file sorter
      case_mode = "smart_case", -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {},
    },
  },
}

telescope.load_extension "ui-select"
telescope.load_extension "fzf"
telescope.load_extension "advanced_git_search"

-- lsp stuff
vim.keymap.set("n", "gr", function()
  builtin.lsp_references {
    show_line = false,
  }
end)

vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[C]ode [A]ctions" })
vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "[C]ode [D]iagnostics" })
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "[C]ode [R]ename" })
vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "[G]oto [D]efinitions" })
vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Show [K]ind" })

-- See `:help telescope.builtin`
vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
vim.keymap.set("n", "<leader><space>", function()
  builtin.buffers {
    sort_mru = true,
    ignore_current_buffer = true,
  }
end, { desc = "[ ] Find existing buffers" })
vim.keymap.set("n", "<leader>/", function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = "[/] Fuzzily search in current buffer" })

vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
vim.keymap.set(
  "n",
  "<Leader>sf",
  ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
  { noremap = true, silent = true, desc = "[S]earch [F]iles" }
)
vim.keymap.set("n", "<leader>sh", builtin.help_tags, { desc = "[S]earch [H]elp" })
vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })

function vim.getVisualSelection()
  vim.cmd 'noau normal! "vy"'
  local text = vim.fn.getreg "v"
  vim.fn.setreg("v", {})

  text = string.gsub(text, "\n", "")
  if #text > 0 then
    return text
  else
    return ""
  end
end

local keymap = vim.keymap.set
local tb = require "telescope.builtin"
local opts = { noremap = true, silent = true }

keymap(
  "n",
  "<leader>st",
  ":lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ')})<cr>",
  opts
)
keymap("v", "<leader>st", function()
  local text = vim.getVisualSelection()
  tb.grep_string { search = text }
end, opts)

