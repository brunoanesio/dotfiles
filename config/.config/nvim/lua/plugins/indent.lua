vim.opt.list = false
require("indent_blankline").setup({
	-- char = '¦',
	filetype_exclude = { "NvimTree", "packer", "lsp-installer", "help" },
	show_end_of_line = true,
	show_current_context = false,
	show_current_context_start = false,
})
