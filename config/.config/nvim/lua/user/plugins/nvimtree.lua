require("nvim-tree").setup({
	update_cwd = true,
	open_on_setup = false,
	open_on_tab = false,
	sync_root_with_cwd = true,
	view = {
		width = 36,
	},
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
		icons = {
			glyphs = {
				git = {
					unstaged = "",
					staged = "",
					unmerged = "",
					renamed = "",
					untracked = "",
					deleted = "✖",
					ignored = "",
				},
			},
		},
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
})
