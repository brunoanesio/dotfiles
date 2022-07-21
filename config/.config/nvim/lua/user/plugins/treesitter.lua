require("nvim-treesitter.configs").setup({
	ensure_installed = {
		"python",
		"lua",
		"javascript",
		"html",
		"css",
		"bash",
		"markdown",
		"markdown_inline",
		"vim",
		"rust",
		"norg",
	},

	sync_install = false,

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	refactor = {
		highlight_definitions = { enable = false },
		smart_rename = {
			enable = true,
			keymaps = {
				smart_rename = "grr",
			},
		},
		navigation = {
			enable = true,
			keymaps = {
				goto_definition = "gnd",
				list_definitions = "gnD",
				list_definitions_toc = "gO",
				goto_next_usage = "<A-*>",
				goto_previous_usage = "<A-#>",
			},
		},
	},
	autotag = {
		enable = true,
	},
	rainbow = {
		enable = true,
		-- One Dark colors
		-- colors = {
		-- 	"#e06c75",
		-- 	"#98c379",
		-- 	"#ebd09c",
		-- 	"#61afef",
		-- 	"#c678dd",
		-- 	"#56b6c2",
		-- 	"#798294",
		-- },
	},
})
