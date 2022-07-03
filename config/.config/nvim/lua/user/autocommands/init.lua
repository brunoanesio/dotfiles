vim.api.nvim_create_augroup("bufcheck", { clear = true })
-- reload config file on change
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "bufcheck",
	pattern = vim.env.MYVIMRC,
	command = "silent source %",
})
-- highlight yanks
vim.api.nvim_create_autocmd("TextYankPost", {
	group = "bufcheck",
	pattern = "*",
	callback = function()
		vim.highlight.on_yank({ timeout = 500 })
	end,
})
-- start git messages in insert mode
vim.api.nvim_create_autocmd("FileType", {
	group = "bufcheck",
	pattern = { "gitcommit", "gitrebase" },
	command = "startinsert | 1",
})
