return {
  "lukas-reineke/indent-blankline.nvim",
  event = "BufReadPost",
  main = "ibl",
  ---@module "ibl"
  ---@diagnostic disable-next-line: undefined-doc-name
  ---@type ibl.config
  opts = {
    indent = {
      char = "▎",
      highlight = "IblChar",
    },
    scope = {
      char = "▎",
      highlight = "IblScopeChar",
    },
  },
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "blankline")
    require("ibl").setup(opts)
  end,
}
