---------------------------------------------------------------------------------------------------------------------
-- SHORTCUTS (Navigate to certain sections by searcing these words) ("Visual Line + *" to instantly go to section) --
---------------------------------------------------------------------------------------------------------------------
-- 1 PACKAGE MANAGER
-- 2 LSP RELATED PLUGINS
-- 3 GIT RELATED PLUGINS
-- 4 APPEARANCE
-- 5 FILE NAVIGATION
-- 6 OTHER QUALITY OF LIFE FEATURES
-- 7 NICE-TO-HAVE PLUGINS

-- disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true

-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.system { 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path }
  vim.cmd [[packadd packer.nvim]]
end


require('packer').startup(function(use)
  ---------------------
  -- 1 PACKAGE MANAGER --
  ---------------------

  use 'wbthomason/packer.nvim'

  -------------------------
  -- 2 LSP RELATED PLUGINS --
  -------------------------

  -- Null-ls 
  -- Description: Autoformats the code using Prettier
  use 'jose-elias-alvarez/null-ls.nvim'

  -- Prettier
  -- Requires: prettierd
  -- Description: Formats code
  use 'MunifTanjim/prettier.nvim'

  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }

  -- Flutter + dart
  use 'dart-lang/dart-vim-plugin'
  use 'thosakwe/vim-flutter'
  use 'natebosch/vim-lsc'
  use 'natebosch/vim-lsc-dart'

  -------------------------
  -- 3 GIT RELATED PLUGINS --
  -------------------------

  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  ------------------
  -- 4 APPEARANCE --
  ------------------

  use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use 'nvim-lualine/lualine.nvim' -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use 'numToStr/Comment.nvim' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically
  use 'tpope/vim-surround' -- Surround text with symbols

  -- Make neovim transparent
  use 'xiyaowong/nvim-transparent'

  -- Color Preview
  use 'norcalli/nvim-colorizer.lua'

  -----------------------
  -- 5 FILE NAVIGATION --
  -----------------------

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -------------------------------------
  -- 6 OTHER QUALITY OF LIFE PLUGINS --
  -------------------------------------

  -- Automatic closing tags
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'

  -- Undotree
  use 'mbbill/undotree'

  -- leap.nvim
  use 'ggandor/leap.nvim'

  -- Color Picker
  use ({"ziontee113/color-picker.nvim",
    config = function()
      require("color-picker")
    end
  })

  ----------------------------
  -- 7 NICE-TO-HAVE PLUGINS --
  ----------------------------

  -- Tagbar
  -- Requires: ctags
  use 'majutsushi/tagbar'

  -- Discord Rich Presence/RPC
  use 'andweeb/presence.nvim'

  -------------------------
  -- LOAD CUSTOM PLUGINS --
  -------------------------

  -- Add custom plugins to packer from ~/.config/nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, 'custom.plugins')
  if has_plugins then
    plugins(use)
  end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
