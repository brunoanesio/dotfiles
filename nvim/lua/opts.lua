local options = {
  syntax = "on",
  cmdheight = 1,
  showmode = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
  virtualedit = "block",
  hlsearch = true,
  incsearch = true,
  ignorecase = true,
  smartcase = true,
  smarttab = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  wrap = false,
  linebreak = false,
  breakindent = true,
  showbreak = "",
  scrolloff = 10,
  fileencoding = "utf-8",
  termguicolors = true,
  number = true,
  relativenumber = true,
  cursorline = true,
  mouse = "a",
  timeoutlen = 500,
  hidden = true,
  updatetime = 200,
  clipboard = { "unnamed" },
  completeopt = { "noinsert", "noselect" },
  laststatus = 3,
  fillchars = "eob: ",
  undofile = true,
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
}

vim.opt.whichwrap:append "<,>,[,],h,l"

for k, v in pairs(options) do
  vim.opt[k] = v
end
