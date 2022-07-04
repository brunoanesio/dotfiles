local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- custom mappings
map("n", "<leader>nt", ":tabnew<CR>", opts)
-- bufferline mappings
map("n", "<A-,>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<A-.>", ":BufferLineCycleNext<CR>", opts)
map("n", "<A-<>", ":BufferLineMovePrev<CR>", opts)
map("n", "<A->>", ":BufferLineMoveNext<CR>", opts)
map("n", "<A-1>", ":BufferLineGoToBuffer 1<CR>", opts)
map("n", "<A-2>", ":BufferLineGoToBuffer 2<CR>", opts)
map("n", "<A-3>", ":BufferLineGoToBuffer 3<CR>", opts)
map("n", "<A-4>", ":BufferLineGoToBuffer 4<CR>", opts)
map("n", "<A-5>", ":BufferLineGoToBuffer 5<CR>", opts)
map("n", "<A-6>", ":BufferLineGoToBuffer 6<CR>", opts)
map("n", "<A-7>", ":BufferLineGoToBuffer 7<CR>", opts)
map("n", "<A-8>", ":BufferLineGoToBuffer 8<CR>", opts)
map("n", "<A-9>", ":BufferLineGoToBuffer 9<CR>", opts)
map("n", "<A-q>", ":BufferLineCloseLeft<CR>", opts)
map("n", "<A-e>", ":BufferLineCloseRight<CR>", opts)
map("n", "<A-c>", ":BufferLinePickClose<CR>", opts)
map("n", "<C-p>", ":BufferLinePick<CR>", opts)
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
map("i", "jk", "<ESC>", opts)
-- Stay in visual mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
