require("jabs").setup({
	-- Main window
	position = "center",
	width = 80,
	height = 20,
	border = "rounded",

	-- Preview window
	preview_position = "right",
	preview = {
		width = 40,
		height = 60,
		border = "rounded",
	},

	-- Keymaps
	keymap = {
		close = "d",
		jump = "<cr>",
		h_split = "h",
		v_split = "v",
		preview = "p",
	},

	-- Icons next to filenames
	use_devicons = true,
})
