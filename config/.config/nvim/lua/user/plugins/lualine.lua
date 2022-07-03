local function lsp_server()
	local msg = "No Active Lsp"
	local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
	local clients = vim.lsp.get_active_clients()
	if next(clients) == nil then
		return msg
	end
	for _, client in ipairs(clients) do
		local filetypes = client.config.filetypes
		if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
			return client.name
		end
	end
	return msg
end

require("lualine").setup({
	options = {
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		theme = "onedark-nvim",
		disabled_filetypes = { "alpha" },
		always_divide_middle = true,
		globalstatus = true,
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = { "branch", "diff" },
		lualine_c = { "filename", "diagnostics" },
		-- lualine_x = { "encoding", "fileformat", "filetype" },
		lualine_x = { { lsp_server, icon = " LSP:" }, "fileformat", "filetype" },
		lualine_y = { "progress" },
		lualine_z = { "location" },
	},
	extensions = { "nvim-tree", "toggleterm", "neo-tree" },
})
