return require('packer').startup(function()
-- packer
  use 'wbthomason/packer.nvim'

-- theme
  use 'monsonjeremy/onedark.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'nvim-lualine/lualine.nvim'
  use 'norcalli/nvim-colorizer.lua'
--use { 'goolord/alpha-nvim', config = function () require'alpha'.setup(require'alpha.themes.dashboard'.config) end }
-- IDE features
  use { 'kyazdani42/nvim-tree.lua', config = function() require'nvim-tree'.setup {} end }
  use 'rcarriga/nvim-notify'
  use 'akinsho/bufferline.nvim'
  use 'windwp/nvim-autopairs'
  use "lukas-reineke/indent-blankline.nvim"
-- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-refactor'
-- Telescope
  use { 'nvim-telescope/telescope.nvim', requires = { {'nvim-lua/plenary.nvim'} } }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
-- LSP
  use {
      'neovim/nvim-lspconfig',
      'williamboman/nvim-lsp-installer',
      'hrsh7th/nvim-cmp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lsp',
      'saadparwaiz1/cmp_luasnip',
      'L3MON4D3/LuaSnip',
      'onsails/lspkind-nvim',
      'jose-elias-alvarez/null-ls.nvim'
  }
end)
