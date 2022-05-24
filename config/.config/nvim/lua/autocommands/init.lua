vim.cmd([[
    augroup _general_settings
    autocmd!
    autocmd FileType lsp-installer lua vim.api.nvim_win_set_config(0, { border = "rounded" })
]])
