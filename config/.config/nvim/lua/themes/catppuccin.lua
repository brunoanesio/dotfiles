local catppuccin = require("catppuccin")

catppuccin.setup({
	styles = {
		comments = "italic",
		conditionals = "italic",
		loops = "NONE",
		functions = "italic",
		keywords = "italic",
		strings = "NONE",
		variables = "NONE",
		numbers = "NONE",
		booleans = "NONE",
		properties = "NONE",
		types = "NONE",
		operators = "NONE",
	},
	integrations = {
		which_key = true,
		lightspeed = true,
		nvimtree = {
			enabled = true,
			show_root = false,
			transparent_panel = false,
		},
		gitsigns = true,
		notify = true,
		indent_blankline = {
			enabled = true,
			colored_indent_levels = false,
		},
		bufferline = true,
		ts_rainbow = true,
	},
})

vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
vim.cmd([[colorscheme catppuccin]])
