return {
  "stevearc/conform.nvim",
  event = "BufWritePre",
  cmd = "ConformInfo",
  opts = {
    formatters_by_ft = {
      lua = { "stylua" },
      css = { "prettierd" },
      scss = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      yaml = { "prettierd" },
      go = { "goimports", "gofmt", "golines" },
      gomod = { "goimports", "gofmt" },
      gowork = { "goimports", "gofmt" },
      gotmpl = { "goimports", "gofmt" },
      python = { "ruff_format" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      cpp = { "clang-format" },
      rust = { "rustfmt" },
      toml = { "taplo" },
    },

    formatters = {
      golines = {
        prepend_args = { "--max-len=80" },
      },
    },

    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
  keys = {
    {
      "<leader>lf",
      function()
        require("conform").format { async = true, lsp_format = "fallback" }
      end,
      desc = "Format with conform",
    },
  },
}
