-- LSP-Installer
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup({
	ensure_installed = { "pylsp", "sumneko_lua", "html", "tsserver", "cssls", "bashls", "emmet_ls", "jsonls" },
	automatic_installation = true,
	ui = {
		border = "rounded",
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗",
		},
	},
})

-- LSP config
local lspconfig = require("lspconfig")
-- Automatic install
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
})
-- Setup LSP servers installed by LSP-Installer
for _, server in ipairs(lsp_installer.get_installed_servers()) do
	lspconfig[server.name].setup({})
end

-- LSP languages config
lspconfig.html.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	filetypes = { "html", "htmldjango" },
	init_options = {
		embeddedLanguages = {
			configurationSection = { "html", "css", "javascript" },
			css = true,
			javascript = true,
		},
		provideFormatter = false,
	},
})
lspconfig.emmet_ls.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	filetypes = { "html", "htmldjango", "css", "typescriptreact", "javascriptreact" },
})
lspconfig.sumneko_lua.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			telemetry = {
				enable = false,
			},
		},
	},
})
require("typescript").setup({
	disable_formatting = true,
	server = {
		on_attach = require("user.lsp.handlers").on_attach,
		capabilities = require("user.lsp.handlers").capabilities,
	},
})
-- Install extensions: PylspInstall pyls-flake8 pylsp-isort python-lsp-black pylsp-rope
lspconfig.pylsp.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = false, -- Disabled otherwise it gets duplicated
					maxLineLength = 95,
				},
				rope_completion = {
					enabled = false, -- Disabled otherwise it gets duplicated
				},
			},
		},
	},
})
lspconfig.jsonls.setup({
	on_attach = require("user.lsp.handlers").on_attach,
	capabilities = require("user.lsp.handlers").capabilities,
	init_options = {
		provideFormatter = false,
	},
})
