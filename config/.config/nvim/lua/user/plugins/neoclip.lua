require("neoclip").setup({
	default_register = { '"', "+", "*" },
	keys = {
		telescope = {
			i = {
				select = "<cr>",
				paste = "<c-p>",
				paste_behind = "<c-k>",
				replay = "<c-q>", -- replay a macro
				delete = "<c-d>", -- delete an entry
				custom = {},
			},
			n = {
				select = "<cr>",
				paste = "p",
				paste_behind = "P",
				replay = "q",
				delete = "d",
				custom = {},
			},
		},
	},
})
