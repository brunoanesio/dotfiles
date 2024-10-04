return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPre",
  main = "ibl",
  ---@module "ibl"
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type ibl.config
  opts = {
    indent = {
      char = "▎",
      highlight = { "IblChar" },
    },
    scope = {
      highlight = { "IblScopeChar" },
      -- highlight = { "Function", "Label" },
    },
  },
}
