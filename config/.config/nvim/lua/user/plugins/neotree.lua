require("neo-tree").setup({
	close_if_last_window = true,
	default_component_configs = {
		mappings = {
			["<space>"] = {
				"toggle_node",
				nowait = true,
			},
		},
		filesystem = {
			filtered_items = {
				hide_dotfiles = false,
			},
			follow_current_file = true,
		},
	},
})
