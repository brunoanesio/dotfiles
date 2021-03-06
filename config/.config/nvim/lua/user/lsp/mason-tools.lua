require("mason-tool-installer").setup({
	ensure_installed = {
		"stylua",
		"bash-language-server",
		"black",
		"css-lsp",
		"djlint",
		"emmet-ls",
		"flake8",
		"html-lsp",
		"isort",
		"json-lsp",
		"lua-language-server",
		"marksman",
		"prettier",
		"python-lsp-server",
		"shellcheck",
		"shfmt",
		"stylua",
		"typescript-language-server",
	},
	auto_update = false,
	run_on_start = true,
})
