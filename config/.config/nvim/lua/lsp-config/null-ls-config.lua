local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(clients)
			return vim.tbl_filter(function(client)
				return client.name ~= { "sumneko_lua", "tsserver" }
			end, clients)
		end,
		bufnr = bufnr,
	})
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

require("null-ls").setup({
	sources = {
		-- python and django
		formatting.black,
		-- diagnostics.flake8,
		formatting.djlint,
		diagnostics.djlint,
		-- lua
		formatting.stylua,
		-- js,ts,etc
		formatting.prettier,
		-- diagnostics.eslint,
		code_actions.eslint,
		-- bash
		formatting.shfmt,
	},
	on_attach = on_attach,
})
