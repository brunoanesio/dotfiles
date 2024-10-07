vim.loader.enable()
-- setup opts and keymaps before lazy
require "opts"
require "keymaps"

-- put this in your main init.lua file ( before lazy setup )
vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46_cache/"

-- setup lazy
require "config.lazy"

-- put this after lazy setup
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")
dofile(vim.g.base46_cache .. "syntax")
dofile(vim.g.base46_cache .. "devicons")
dofile(vim.g.base46_cache .. "colors")
