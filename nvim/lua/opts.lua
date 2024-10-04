local options = {
  syntax = "on",
  cmdheight = 1,
  showmode = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  softtabstop = 2,
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
  completeopt = { "menu", "menuone", "noselect", "preview" },
  laststatus = 3,
  fillchars = "eob: ",
  undofile = true,
  sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions",
}

vim.opt.whichwrap:append "<,>,[,],h,l"

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- local os_name = vim.loop.os_uname().sysname
-- if os_name == "Windows_NT" then
--   vim.o.clipboard = {
--     name = "WslClipboard",
--     copy = {
--       ["+"] = "clip.exe",
--       ["*"] = "clip.exe",
--     },
--     paste = {
--       ["+"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--       ["*"] = 'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
--     },
--     cache_enabled = 0,
--   }
-- end
