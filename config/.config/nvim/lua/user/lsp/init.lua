local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("user.lsp.mason")
require("user.lsp.mason-tools")
-- require("user.lsp.servers")
require("user.lsp.handlers").setup()
require("user.lsp.cmp")
require("user.lsp.null-ls")
