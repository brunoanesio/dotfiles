require("bufferline").setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_update_insert = true,
		offsets = { { filetype = "NvimTree", text = "File Explorer" } },
		always_show_bufferline = false,
		show_close_icon = false,
	},
})
