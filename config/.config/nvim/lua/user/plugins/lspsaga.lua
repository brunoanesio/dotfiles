local saga = require("lspsaga")

saga.init_lsp_saga({
	max_preview_lines = 15,
	code_action_icon = "",
	border_style = "rounded",
	diagnostic_header = { " ", " ", " ", "" },
})
