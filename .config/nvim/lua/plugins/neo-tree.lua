require("neo-tree").setup({
	close_if_last_window = true,
	window = {
		position = "right",
		width = 20,
		mapping_options = {
			noremap = true,
			nowait = true,
		},
	},
	buffers = {
		leave_dirs_open = true,
		follow_current_file = {
			enabled = true,
			leave_dirs_open = true,
		},
		bind_to_cwd = false,
	},
	filesystem = {
		bind_to_cwd = false,
	},
})
