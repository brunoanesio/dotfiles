return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "LspInfo" },
  dependencies = {
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      keys = { { "<leader>pm", "<cmd>Mason<cr>", desc = "Mason" } },
      opts = {
        ui = {
          border = "single",
          icons = {
            package_installed = "󰄳 ",
            package_pending = " ",
            package_uninstalled = " ",
          },
        },
      },
      config = function(_, opts)
        require("mason").setup(opts)
      end,
    },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    "hrsh7th/cmp-nvim-lsp",
    { "j-hui/fidget.nvim", opts = { notification = { window = { winblend = 0 } } } },
  },
  config = function()
    -- vim.highlight.priorities.semantic_tokens = 94
    vim.api.nvim_create_autocmd("LspAttach", {
      desc = "LSP actions",
      callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
        vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
        vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
        vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
        vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
        vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
        vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
        vim.keymap.set("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
        vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
        vim.keymap.set("n", "gl", "<cmd>lua vim.diagnostic.open_float()<cr>")
        vim.keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<cr>")
        vim.keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<cr>")
      end,
    })
    local capabilities = vim.lsp.protocol.make_client_capabilities()
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

    local servers = require "config.servers"
    require("mason").setup()
    local ensure_installed = vim.tbl_keys(servers or {})
    vim.list_extend(ensure_installed, {
      "basedpyright",
      "bashls",
      "clang-format",
      "clangd",
      "css-lsp",
      "goimports",
      "golines",
      "gopls",
      "json-lsp",
      "lua_ls",
      "prettierd",
      "ruff",
      "shellcheck",
      "shfmt",
      "stylua",
    })
    require("mason-tool-installer").setup { ensure_installed = ensure_installed }
    require("mason-lspconfig").setup {
      handlers = {
        function(server_name)
          local server = servers[server_name] or {}
          server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
          require("lspconfig")[server_name].setup(server)
        end,
      },
    }
  end,
}
