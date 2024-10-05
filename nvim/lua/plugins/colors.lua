return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    lazy = false,
    opts = {
      transparent_background = false,
      default_integrations = true,
      integrations = {
        cmp = true,
        treesitter = true,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        mason = true,
        fidget = true,
      },
      custom_highlights = function(colors)
        return {
          DiagnosticVirtualTextError = { fg = colors.red, bg = colors.none },
          DiagnosticVirtualTextWarn = { fg = colors.yellow, bg = colors.none },
          DiagnosticVirtualTextInfo = { fg = colors.sky, bg = colors.none },
          DiagnosticVirtualTextHint = { fg = colors.teal, bg = colors.none },
        }
      end,
    },
    init = function()
      vim.cmd.colorscheme "catppuccin"
    end,
  },
}
