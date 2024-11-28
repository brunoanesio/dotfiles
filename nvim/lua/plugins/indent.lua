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
    },
    scope = {
      char = "▎",
    },
  },
  config = function(_, opts)
    require("ibl").setup(opts)
  end,
}
