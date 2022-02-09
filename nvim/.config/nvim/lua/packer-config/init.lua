return require('packer').startup(function(use)
-- packer
  use 'wbthomason/packer.nvim'

-- theme
  -- use 'monsonjeremy/onedark.nvim'
  use 'ful1e5/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'norcalli/nvim-colorizer.lua'
-- IDE features
  use 'kyazdani42/nvim-tree.lua'
  use 'rcarriga/nvim-notify'
  use 'akinsho/bufferline.nvim'
  use 'windwp/nvim-autopairs'
  use "lukas-reineke/indent-blankline.nvim"
  use "lewis6991/gitsigns.nvim"
-- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
-- Telescope
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
-- LSP
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind-nvim',
      'rafamadriz/friendly-snippets',
      'jose-elias-alvarez/null-ls.nvim'
  }
end)
