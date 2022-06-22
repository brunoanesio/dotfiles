return require("packer").startup(function(use)
	-- Packer
	use("wbthomason/packer.nvim")
	-- QoL
	use("lewis6991/impatient.nvim")
	use("folke/which-key.nvim")
	use("famiu/bufdelete.nvim")
	use("folke/todo-comments.nvim")
	use("ggandor/lightspeed.nvim")
	use("folke/zen-mode.nvim")
	use("folke/twilight.nvim")
	use("stevearc/dressing.nvim")

	-- Theme
	use("ful1e5/onedark.nvim")
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
	use({ "akinsho/toggleterm.nvim" })
	use({ "goolord/alpha-nvim" })
	-- Treesitter
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/nvim-treesitter-refactor")
	use("p00f/nvim-ts-rainbow")
	-- Telescope
	use("nvim-lua/plenary.nvim")
	use("nvim-telescope/telescope.nvim")
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-media-files.nvim")
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use("nvim-telescope/telescope-symbols.nvim")
	use("AckslD/nvim-neoclip.lua")
	use("nvim-telescope/telescope-project.nvim")
	-- LSP
	use({
		"neovim/nvim-lspconfig",
		"williamboman/nvim-lsp-installer",
		"jose-elias-alvarez/typescript.nvim",
		-- CMP
		"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-emoji",
		"saadparwaiz1/cmp_luasnip",
		-- Snippets
		"L3MON4D3/LuaSnip",
		"onsails/lspkind-nvim",
		"rafamadriz/friendly-snippets",
		-- Null-ls
		"jose-elias-alvarez/null-ls.nvim",
	})
end)
