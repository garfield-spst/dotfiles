require("noice").setup({
	views = {
		cmdline_popup = {
			size = {
				height = "auto",
				width = "50%",
			},
			position = {
				row = "40%",
				col = "40%",
			},
			border = {
				style = "rounded",
			},
		},
	},
	lsp = {
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true,
		},
		message = {
			enabled = false,
			view = "mini",
		},
	},
	messages = {
		enabled = true,
		view = "mini",
		view_error = "mini",
		view_warn = false,
		view_history = "messages",
		view_search = "virtualtext",
	},
	notify = {
		enabled = true,
		view = "mini",
	},
	error = {
		enabled = true,
		view = "mini",
	},
	presets = {
		bottom_search = false,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = true, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = true,
	},
	routes = {
		{
			view = "mini",
			filter = { event = "msg_showmode" },
		},
	},
})
