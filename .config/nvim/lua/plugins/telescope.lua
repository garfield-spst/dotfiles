require("telescope").setup({
	defaults = {
		preview = true,
		path_display = { "smart" },
		color_devicons = true,
	},
	pickers = {
		live_grep = {
			theme = "dropdown",
			previewer = true,
			layout_config = {
				width = 0.50,
				height = 0.55,
			},
		},
		grep_string = {
			theme = "dropdown",
		},
		current_buffer_fuzzy_find = {
			theme = "dropdown",
			previewer = false,
			layout_config = {
				width = 0.45,
				height = 0.55,
			},
		},
		find_files = {
			theme = "dropdown",
			previewer = false,
			hidden = true,
			layout_config = {
				width = 0.45,
				height = 0.45,
			},
		},
		oldfiles = {
			theme = "dropdown",
			layout_config = {
				width = 0.45,
				height = 0.45,
			},
			previewer = false,
		},
		buffers = {
			theme = "dropdown",
			layout_config = {
				width = 0.4,
				height = 0.4,
			},
			mappings = {
				i = {
					["<C-d>"] = "delete_buffer",
				},
			},
			previewer = false,
			initial_mode = "insert",
			bufnr_width = 0,
			show_all_buffers = true,
			ignore_current_buffer = true,
			sort_lastused = true,
			path_display = { "tail" },
		},
		planets = {
			show_pluto = true,
			show_moon = true,
		},
		colorscheme = {
			enable_preview = true,
		},
		lsp_references = {
			theme = "dropdown",
			initial_mode = "normal",
		},
		lsp_definitions = {
			theme = "dropdown",
			initial_mode = "normal",
		},
		man_pages = {
			theme = "dropdown",
		},
		lsp_declarations = {
			theme = "dropdown",
			initial_mode = "normal",
		},
		lsp_implementations = {
			theme = "dropdown",
			initial_mode = "normal",
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
})
