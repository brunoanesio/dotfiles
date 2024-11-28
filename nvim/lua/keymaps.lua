local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

map("n", "<leader>qq", ":qa!<CR>", opts)
map("n", "<ESC>", ":noh <CR>", opts)
map("i", "jk", "<ESC>", opts)
map("n", "<C-s>", ":wa!<CR>", opts)

-- buffer mappings
map("n", "<Tab>", ":bnext<CR>", opts)
map("n", "<S-Tab>", ":bprevious<CR>", opts)
map("n", "<leader>x", ":bdelete<CR>", opts)
-- Visual mappings
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
-- Normal mappings
map("n", "J", "mzJ`z", opts)
-- paste remap
map("v", "<leader>p", '"_dp')
map("v", "<leader>P", '"_dP')
map({ "n", "x" }, "<leader>p", [["0p]])
-- clipboard
map("n", "<leader>y", '"+y')
map("v", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')
map("n", "<leader>d", '"_d')
map("v", "<leader>d", '"_d')
-- Splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<leader>pl", "<CMD>Lazy<CR>", opts)
