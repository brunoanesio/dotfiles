require('onedark').setup()
require('colorizer').setup()
require('lualine').setup {
  options = {
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    theme = 'onedark'
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  }
}
vim.opt.list = false
require('indent_blankline').setup {
    -- char = '¦',
    show_end_of_line = true,
    show_current_context = true,
    show_current_context_start = false,
}
