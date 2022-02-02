local null_ls = require('null-ls')

local formatting = null_ls.builtins.formatting
local code_actions = null_ls.builtins.code_actions

local sources = {
    formatting.autopep8,
    code_actions.eslint,
    formatting.eslint,
}

null_ls.setup({
    sources = sources
})
