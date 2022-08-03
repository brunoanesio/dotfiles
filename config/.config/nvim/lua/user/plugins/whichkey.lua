local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
	return
end

local setup = {
	plugins = {
		marks = true,
		registers = true,
		spelling = {
			enabled = true,
			suggestions = 20,
		},
		presets = {
			operators = false,
			motions = true,
			text_objects = true,
			windows = true,
			nav = true,
			z = true,
			g = true,
		},
	},
	key_labels = {
		["<space>"] = "SPC",
		["<cr>"] = "RET",
		["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»",
		separator = "➜",
		group = "+",
	},
	popup_mappings = {
		scroll_down = "<c-d>",
		scroll_up = "<c-u>",
	},
	window = {
		border = "rounded",
		position = "bottom",
		margin = { 1, 0, 1, 0 },
		padding = { 2, 2, 2, 2 },
		winblend = 0,
	},
	layout = {
		height = { min = 4, max = 25 },
		width = { min = 20, max = 50 },
		spacing = 3,
		align = "left",
	},
	ignore_missing = true,
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
	show_help = true,
	triggers = "auto",
	triggers_blacklist = {
		i = { "j", "k" },
		v = { "j", "k" },
	},
}

local opts = {
	mode = "n",
	prefix = "<leader>",
	buffer = nil,
	silent = true,
	noremap = true,
	nowait = true,
}

local mappings = {
	["a"] = { "<cmd>Alpha<cr>", "Alpha" },
	["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["x"] = { "<cmd>x!<CR>", "Save and quit" },
	["d"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
	["h"] = { "<cmd>set hlsearch!<CR>", "Toggle Highlight" },
	["r"] = { "<cmd>set relativenumber!<CR>", "Toggle Relative Number" },
	["X"] = { "<cmd>!xdg-open %<CR>", "Open file with XDG-Open" },
	["z"] = { "<cmd>ZenMode<CR>", "Toggle ZenMode" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<cr>", "Compile" },
		i = { "<cmd>PackerInstall<cr>", "Install" },
		s = { "<cmd>PackerSync<cr>", "Sync" },
		S = { "<cmd>PackerStatus<cr>", "Status" },
		u = { "<cmd>PackerUpdate<cr>", "Update" },
	},

	b = {
		name = "Buffer",
		b = { "<cmd>JABSOpen<cr>", "See open buffers" },
		n = { "<cmd>bnext<cr>", "Next Buffer" },
		p = { "<cmd>bprevious<cr>", "Prev Buffer" },
	},

	g = {
		name = "Git",
		j = { "<cmd>Gitsigns next_hunk<cr>", "Next Hunk" },
		k = { "<cmd>Gitsigns prev_hunk<cr>", "Prev Hunk" },
		l = { "<cmd>Gitsigns blame_line<cr>", "Blame" },
		p = { "<cmd>Gitsigns preview_hunk<cr>", "Preview Hunk" },
		r = { "<cmd>Gitsigns reset_hunk<cr>", "Reset Hunk" },
		R = { "<cmd>Gitsigns reset_buffer<cr>", "Reset Buffer" },
		S = { "<cmd>Gitsigns stage_buffer<cr>", "Stage Buffer" },
		u = { "<cmd>Gitsigns undo_stage_hunk<cr>", "Undo Stage Hunk" },
		s = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		f = { "<cmd>Telescope git_files<cr>", "See git files" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		d = { "<cmd>Gitsigns diffthis HEAD<cr>", "Diff" },
	},

	l = {
		name = "LSP",
		c = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
		F = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
		f = { "<cmd>lua vim.lsp.buf.format({async=true})<cr>", "Format" },
		I = { "<cmd>LspInfo<cr>", "Info" },
		i = { "<cmd>Mason<cr>", "Mason Info" },
		j = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next Diagnostic" },
		k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev Diagnostic" },
		K = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
		R = { "<cmd>lua vim.lsp.buf.references()<cr>", "References" },
		d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
		D = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
		S = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Workspace Symbols" },
		q = { "<cmd>lua vim.diagnostic.setloclist<cr>", "Quickfix" },
	},
	f = {
		name = "Telescope",
		s = { "<cmd>Telescope symbols<cr>", "Symbols" },
		f = { "<cmd>Telescope find_files<cr>", "Find Files" },
		g = { "<cmd>Telescope live_grep<cr>", "Live Grep" },
		C = { "<cmd>Telescope commands<cr>", "Commands History" },
		B = { "<cmd>Telescope buffers<cr>", "Buffers" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		c = { "<cmd>Telescope neoclip<cr>", "Neoclip" },
		n = { "<cmd>Telescope notify<cr>", "Show notifications" },
		b = { "<cmd>Telescope file_browser<cr>", "File Browser" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		F = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Current Buffer Find" },
		p = { "<cmd>Telescope projects<cr>", "Projects" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		-- C = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
	},

	t = {
		name = "Terminal",
		N = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
		H = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<cr>", "Lazygit" },
		f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
		t = { "<cmd>ToggleTerm direction=tab<cr>", "Tab" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
	},
}

which_key.setup(setup)
which_key.register(mappings, opts)
