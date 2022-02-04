local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions
local diagnostics = null_ls.builtins.diagnostics

local sources = {
    formatting.autopep8,
    formatting.stylua,
    formatting.prettier,
    code_actions.eslint,
    formatting.eslint,
    diagnostics.eslint,
}

null_ls.setup({
    sources = sources
})
