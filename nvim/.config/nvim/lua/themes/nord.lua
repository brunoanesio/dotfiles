require("onenord").setup({
    styles = {
        comments = "italic",
        keywords = "italic",
    },
})
require("colorizer").setup()
require("lualine").setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		theme = "onenord",
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff", "diagnostics" },
		lualine_c = { "filename" },
		lualine_x = { "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "nvim-tree" },
})
vim.opt.list = false
require("indent_blankline").setup({
	-- char = '¦',
	filetype_exclude = { "NvimTree", "packer", "lsp-installer", "help" },
	show_end_of_line = true,
	show_current_context = false,
	show_current_context_start = false,
})
