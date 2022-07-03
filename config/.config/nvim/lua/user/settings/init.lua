local options = {
	syntax = "on",
	-- cmdheight = 0,
	showmode = false,
	expandtab = true,
	shiftwidth = 4,
	tabstop = 4,
	hlsearch = true,
	incsearch = true,
	ignorecase = true,
	smartcase = true,
	smarttab = true,
	smartindent = true,
	splitbelow = true,
	splitright = true,
	wrap = true,
	scrolloff = 5,
	fileencoding = "utf-8",
	termguicolors = true,
	number = true,
	relativenumber = true,
	cursorline = true,
	mouse = "a",
	timeoutlen = 500,
	hidden = true,
	updatetime = 250,
	clipboard = "unnamedplus",
	completeopt = { "menuone", "noselect" },
	guifont = "JetBrainsMono Nerd Font:h16",
}

vim.notify = require("notify")

for k, v in pairs(options) do
	vim.opt[k] = v
end
