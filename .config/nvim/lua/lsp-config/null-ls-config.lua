local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	-- python and django
	formatting.autopep8,
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
})
