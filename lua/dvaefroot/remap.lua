----------------------------------------------
--                  remaps                  --
----------------------------------------------
-- 1 document navigation
-- 2 buffer navigation
-- 3 file navigation
-- 4 editing
-- 5 lsp related

vim.api.nvim_set_option("clipboard", "unnamedplus")

-- [[ basic keymaps ]]
-- set <space> as the leader key
-- see `:help mapleader`
--  note: must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- keymaps for better default experience
-- see `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<space>', '<nop>', { silent = true })

-------------------------
-- document navigation --
-------------------------

-- remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-----------------------
-- buffer navigation --
-----------------------

-- go to previous buffer
vim.keymap.set('n', '<leader><leader>', '<c-^>', {noremap = true , silent = false})

---------------------
-- file navigation --
---------------------

-- open netrw
vim.keymap.set("n", "<leader>pv", vim.cmd.ex)

-- see `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] find recently opened files' })
vim.keymap.set('n', '<leader>fb', require('telescope.builtin').buffers, { desc = '[ ] find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- you can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] fuzzily search in current buffer]' })

-- telescope remaps
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[s]earch [f]iles' })
-- used for searching for help
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[s]earch [h]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[s]earch current [w]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[s]earch by [g]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[s]earch [d]iagnostics' })

-- toggle nvimtree
vim.keymap.set('n', '<f7>', ':NvimTreeToggle<cr>', {desc = '[t]oggle [n]erd tree'})
vim.keymap.set('n', '<leader>ff', ':NvimTreeFindFile<cr>', {desc = '[f]ind [f]ile in nerd tree'})

--------------
-- editing --
--------------

-- move lines around (only in visual mode)
vim.keymap.set('x', '<c-k>', ':m-2<cr>gv=gv', {noremap = true , silent = false})
vim.keymap.set('x', '<c-j>', ':m+1<cr>gv=gv', {noremap = true , silent = false})

-- indent lines
vim.keymap.set('n', '>', '>>', {noremap = true , silent = false})
vim.keymap.set('n', '<', '<<', {noremap = true , silent = false})
vim.keymap.set('x', '>', '>gv', {noremap = true , silent = false})
vim.keymap.set('x', '<', '<gv', {noremap = true , silent = false})

-- save using ctrl+s
vim.keymap.set('n', '<c-s>', ':w<cr>' , {silent = true})

-- copy entire file
vim.keymap.set('n', '<c-a>', ':%y+<CR>' , {silent = true, noremap = true})

-- select entire file
-- vim.keymap.set('n', '<c-[>', 'ggVG' , {silent = true})

-- latex
vim.cmd[[
  " use tab to expand and jump through snippets
  imap <silent><expr> <leader> luasnip#expand_or_jumpable() ? '<plug>luasnip-expand-or-jump' : '<tab>'
  smap <silent><expr> <leader> luasnip#jumpable() ? '<plug>luasnip-jump-nextu' : '<tab>'

  " use shift-tab to jump backwards through snippets
  imap <silent><expr> <s-leader> luasnip#jumpable(-1) ? '<plug>luasnip-jump-prev' : '<s-tab>'
  smap <silent><expr> <s-leader> luasnip#jumpable(-1) ? '<plug>luasnip-jump-prev' : '<s-tab>'

  " cycle forward through choice nodes with control-f (for example)
  imap <silent><expr> <c-f> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-f>'
  smap <silent><expr> <c-f> luasnip#choice_active() ? '<plug>luasnip-next-choice' : '<c-f>'
]]

-----------------
-- lsp related --
-----------------

-- diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

-- tagbar
vim.keymap.set('n', '<f8>', ':tagbartoggle<cr>', {noremap = true , silent = false})
