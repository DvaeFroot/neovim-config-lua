vim.api.nvim_set_option("clipboard", "unnamedplus")

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<C-s>', ':w<CR>' , {silent = true})

-------------------------
-- DOCUMENT NAVIGATION --
-------------------------

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-------------------------
-- BUFFER NAVIGATION --
-------------------------

-- Go to previous buffer
vim.keymap.set('n', '<leader><leader>', '<C-^>', {noremap = true , silent = false})

-- Go to adjacent buffers
vim.keymap.set('n', '<leader>h', '<C-w>h', {noremap = false , silent = false})
vim.keymap.set('n', '<leader>j', '<C-w>j', {noremap = false , silent = false})
vim.keymap.set('n', '<leader>k', '<C-w>k', {noremap = false , silent = false})
vim.keymap.set('n', '<leader>l', '<C-w>l', {noremap = true , silent = false})

---------------------
-- FILE NAVIGATION --
---------------------

-- Open netrw
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

-- Toggle Nerdtree
vim.keymap.set('n', '<leader>tn', ':NvimTreeToggle<CR>', {desc = '[T]oggle [N]erd Tree'})
vim.keymap.set('n', '<leader>fn', ':NvimTreeFindFile<CR>', {desc = '[F]ind File in [N]erd Tree'})


--------------
-- EDITING --
--------------

-- Move lines around
vim.keymap.set('x', '<C-K>', ':m-2<cr>gv=gv', {noremap = true , silent = false})
vim.keymap.set('x', '<C-J>', ':m+1<cr>gv=gv', {noremap = true , silent = false})

-- Indent lines
vim.keymap.set('n', '>', '>>', {noremap = true , silent = false})
vim.keymap.set('n', '<', '<<', {noremap = true , silent = false})
vim.keymap.set('x', '>', '>gv', {noremap = true , silent = false})
vim.keymap.set('x', '<', '<gv', {noremap = true , silent = false})

-----------------
-- LSP RELATED --
-----------------

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- Tagbar
vim.keymap.set('n', '<F8>', ':TagbarToggle<CR>', {noremap = true , silent = false})
