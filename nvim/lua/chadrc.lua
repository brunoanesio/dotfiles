local M = {}

---@type ChadrcConfig
M.base46 = {
  theme = "catppuccin",
  transparency = false,
}

M.ui = {
  statusline = { theme = "default", separator_style = "default" },
  tabufline = { enabled = false },
  cmp = {
    -- icons_left = true,
    lspkind_text = true,
    style = "default",
  },
}

return M
