return require("packer").startup(function(use)
	-- packer
	use("wbthomason/packer.nvim")

	-- theme
	use("ful1e5/onedark.nvim")
	-- use 'monsonjeremy/onedark.nvim'
	-- use("rmehri01/onenord.nvim")
	-- use("folke/tokyonight.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("nvim-lualine/lualine.nvim")
	use("norcalli/nvim-colorizer.lua")
	-- IDE features
	use("kyazdani42/nvim-tree.lua")
	use("rcarriga/nvim-notify")
	use("akinsho/bufferline.nvim")
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")
	use("lewis6991/gitsigns.nvim")
	use("numToStr/Comment.nvim")
	use("windwp/nvim-ts-autotag")
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-media-files.nvim")
    use("nvim-telescope/telescope-symbols.nvim")
    use("AckslD/nvim-neoclip.lua")
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-emoji",
		"saadparwaiz1/cmp_luasnip",
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
		"rafamadriz/friendly-snippets",
		"jose-elias-alvarez/null-ls.nvim",
	})
end)
