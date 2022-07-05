-- LSP-Installer config
local lsp_installer = require("nvim-lsp-installer")
lsp_installer.setup({
	ensure_installed = { "pylsp", "sumneko_lua", "html", "tsserver", "cssls", "bashls", "emmet_ls" },
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

-- LSP UI config
vim.diagnostic.config({
	update_in_insert = true,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

-- LSP config and on_attach function
local lspconfig = require("lspconfig")
local function lsp_highlight(client)
	local status_ok, illuminate = pcall(require("illuminate"))
	if not status_ok then
		return
	end
	illuminate.on_attach(client)
end
local function on_attach(client, bufnr)
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = "rounded",
				source = "always",
				prefix = " ",
				scope = "cursor",
			}
			vim.diagnostic.open_float(nil, opts)
		end,
	})
	lsp_highlight(client)
	-- Set up buffer-local keymaps (vim.api.nvim_buf_set_keymap()), etc.
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	-- Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
	buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
	buf_set_keymap("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
	buf_set_keymap("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
	buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
	buf_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
	buf_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
	buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
	buf_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
	buf_set_keymap("n", "<leader>lf", "<cmd>lua vim.lsp.buf.format({async=true})<CR>", opts)
	buf_set_keymap("n", "dp", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
	buf_set_keymap("n", "dn", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
	-- buf_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true

-- Automatic install
lspconfig.util.default_config = vim.tbl_extend("force", lspconfig.util.default_config, {
	on_attach = on_attach,
	capabilities = capabilities,
})
for _, server in ipairs(lsp_installer.get_installed_servers()) do
	lspconfig[server.name].setup({})
end

-- LSP languages config
lspconfig.html.setup({
	on_attach = on_attach,
	capabilities = capabilities,
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
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { "html", "htmldjango", "css", "typescriptreact", "javascriptreact" },
})
lspconfig.pylsp.setup({
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				flake8 = {
					enabled = false,
					maxLineLength = 95,
				},
				-- rope_completion = {
				-- 	enabled = true,
				-- },
			},
		},
	},
})
require("typescript").setup({
	disable_formatting = true,
	server = {
		on_attach = on_attach,
		capabilities = capabilities,
	},
})
