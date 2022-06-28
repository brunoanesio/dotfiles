require("nvim-tree").setup({
	update_cwd = true,
	open_on_setup = false,
	open_on_tab = false,
	sync_root_with_cwd = true,
	renderer = {
		highlight_git = true,
		indent_markers = {
			enable = true,
			icons = {
				corner = "└ ",
				edge = "│ ",
				item = "│ ",
				none = "  ",
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})
