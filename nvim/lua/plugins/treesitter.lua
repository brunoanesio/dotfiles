return {
  "nvim-treesitter/nvim-treesitter",
  event = "BufReadPost",
  build = ":TSUpdate",
  cmd = { "TSUpdate", "TSInstall" },
  main = "nvim-treesitter.configs",
  opts = {
    sync_install = true,
    auto_install = true,

    ensure_installed = { "vimdoc", "lua", "go", "python", "css", "html", "json", "jsonc" },

    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
    },
    context_commenstring = {
      enable = true,
      enable_autocmd = false,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
