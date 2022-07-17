require("nvim-tree").setup({
	update_cwd = true,
	respect_buf_cwd = true,
	open_on_setup = false,
	open_on_tab = false,
	sync_root_with_cwd = true,
	update_focused_file = {
		enable = true,
		update_cwd = true,
	},
	view = {
		width = 40,
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
	git = {
		enable = true,
		ignore = false,
		show_on_dirs = true,
		timeout = 400,
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
