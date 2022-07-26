local status_ok, catppuccin = pcall(require, "catppuccin")
if not status_ok then
	return
end
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

catppuccin.setup({
	styles = {
		comments = { "italic" },
		conditionals = { "italic" },
		loops = {},
		functions = { "italic" },
		keywords = { "italic" },
		strings = {},
		variables = {},
		numbers = {},
		booleans = {},
		properties = {},
		types = {},
		operators = {},
	},
	compile = {
		enabled = true,
		path = vim.fn.stdpath("cache") .. "/catppuccin",
		suffix = "_compiled",
	},
	integrations = {
		which_key = true,
		lightspeed = true,
		nvimtree = {
			enabled = false,
			show_root = false,
			transparent_panel = false,
		},
		neotree = {
			enabled = false,
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

vim.cmd([[colorscheme catppuccin]])
