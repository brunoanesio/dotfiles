local M = {}

M.base46 = {
  theme = "catppuccin",
  transparency = false,
}

M.ui = {
  statusline = { theme = "vscode_colored", separator_style = "default" },
  tabufline = { enabled = false },
  cmp = {
    -- icons_left = true,
    lspkind_text = true,
    style = "atom_colored",
  },
}

return M
