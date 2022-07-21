local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- custom mappings
map("n", "<leader>nt", ":tabnew<CR>", opts)
-- buffer mappings
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)
-- telescope mappings
map("n", "<leader>bm", ":Telescope marks<CR>", opts)
-- Window Navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)
-- Window resize
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)
-- jk fast enter
-- map("i", "jk", "<ESC>", opts)
-- Stay in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
-- Illuminate
map("n", "<a-n>", '<cmd>lua require"illuminate".next_reference{wrap=true}<cr>', opts)
map("n", "<a-p>", '<cmd>lua require"illuminate".next_reference{reverse=true,wrap=true}<cr>', opts)
