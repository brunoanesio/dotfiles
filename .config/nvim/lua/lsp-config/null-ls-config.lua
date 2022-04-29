local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- python and django
	formatting.black,
	diagnostics.flake8,
	formatting.djlint,
	diagnostics.djlint,
	-- lua
	formatting.stylua,
	-- js,ts,etc
	formatting.prettier,
	code_actions.eslint,
	-- bash
	formatting.shfmt,
}

null_ls.setup({
	sources = sources,
	on_attach = function(client)
		if client.resolved_capabilities.document_formatting then
			vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
		end
	end,
})
