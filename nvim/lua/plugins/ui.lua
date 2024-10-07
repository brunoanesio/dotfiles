return {
  { "nvim-lua/plenary.nvim" },
  { "kyazdani42/nvim-web-devicons" },

  {
    "nvchad/ui",
    event = "VeryLazy",
    config = function()
      require "nvchad"
    end,
  },

  {
    "nvchad/base46",
    lazy = true,
    build = function()
      require("base46").load_all_highlights()
    end,
  },
}
