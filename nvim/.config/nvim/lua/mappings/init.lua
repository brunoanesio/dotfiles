local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
map('n', '<leader>h', ':nohlsearch<CR>', opts)
map('n', '<leader>ps', ':PackerSync<CR>', opts)
-- bufferline mappings
map('n', '<A-,>', ':BufferLineCyclePrev<CR>', opts)
map('n', '<A-.>', ':BufferLineCycleNext<CR>', opts)
map('n', '<A-<>', ':BufferLineMovePrev<CR>', opts)
map('n', '<A->>', ':BufferLineMoveNext<CR>', opts)
map('n', '<A-1>', ':BufferLineGoToBuffer 1<CR>', opts)
map('n', '<A-2>', ':BufferLineGoToBuffer 2<CR>', opts)
map('n', '<A-3>', ':BufferLineGoToBuffer 3<CR>', opts)
map('n', '<A-4>', ':BufferLineGoToBuffer 4<CR>', opts)
map('n', '<A-5>', ':BufferLineGoToBuffer 5<CR>', opts)
map('n', '<A-6>', ':BufferLineGoToBuffer 6<CR>', opts)
map('n', '<A-7>', ':BufferLineGoToBuffer 7<CR>', opts)
map('n', '<A-8>', ':BufferLineGoToBuffer 8<CR>', opts)
map('n', '<A-9>', ':BufferLineGoToBuffer 9<CR>', opts)
map('n', '<A-q>', ':BufferLineCloseLeft<CR>', opts)
map('n', '<A-e>', ':BufferLineCloseRight<CR>', opts)
map('n', '<A-c>', ':BufferLinePickClose<CR>', opts)
map('n', '<C-p>', ':BufferLinePick<CR>', opts)
map('n', '<leader>bd', ':BufferLineSortByDirectory<CR>', opts)
map('n', '<leader>be', ':BufferLineSortByExtension<CR>', opts)
-- telescope mappings
map('n', '<leader>ff', ':Telescope find_files<CR>', opts)
map('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
map('n', '<leader>fb', ':Telescope buffers<CR>', opts)
map('n', '<leader>fh', ':Telescope help_tags<CR>', opts)
