require("neorg").setup({
	load = {
		["core.defaults"] = {},
		["core.norg.dirman"] = {
			config = {
				workspaces = {
					home = "~/Documentos/notes/home",
				},
			},
		},
		["core.norg.completion"] = {
			engine = "nvim-cmp",
		},
		["core.norg.concealer"] = {},
		["core.norg.qol.toc"] = {},
		["core.presenter"] = {
			config = {
				zen_mode = "zen-mode",
			},
		},
	},
})
