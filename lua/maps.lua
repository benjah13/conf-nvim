local keymap = vim.keymap

-- Switch to normal mode
keymap.set('i', 'jk', '<Esc>')
keymap.set('i', 'kj', '<Esc>')
keymap.set('i', 'jj', '<Esc>')
keymap.set('i', 'kk', '<Esc>')

-- Do not yank with x
keymap.set('n', 'x', '"_x')

-- -- Do not yank on paste
keymap.set('v', 'p', '\"_dP')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

--Save all
keymap.set('n', '<C-s>', ':wa<Return>', { silent = true })

-- tabs
keymap.set('n', 'te', ':tab split<Return>', { silent = true })
keymap.set('n', 'tp', ':tabprevious<Return>', { silent = true })
keymap.set('n', 'tn', ':tabnext<Return>', { silent = true })

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w', { silent = true })
keymap.set('n', 'sv', ':vsplit<Return><C-w>w', { silent = true })
-- Move window
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- Neotree
keymap.set('n', '<leader>e', ':NeoTreeRevealToggle<Return>', { silent = true })
keymap.set('n', '<leader>gst', ':Neotree git_status<Return>', { silent = true })

-- Move lines
keymap.set('n', '<C-j>', ':m .+1<CR>==', { silent = true })
keymap.set('n', '<C-k>', ':m .-2<CR>==', { silent = true })
keymap.set('v', '<C-j>', ":m '>+1<CR>gv=gv", { silent = true })
keymap.set('v', '<C-k>', ":m '<-2<CR>gv=gv", { silent = true })

-- LazyGit
keymap.set('n', '<leader>gg', ':LazyGit<Return>', { silent = true })
