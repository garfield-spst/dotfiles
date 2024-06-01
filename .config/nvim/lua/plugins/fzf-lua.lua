require("fzf-lua").setup({
	winopts = {
		height = 0.45, -- window height
		width = 0.60, -- window width
		row = 0.50, -- window row position (0=top, 1=bottom)
		col = 0.50, -- window col position (0=left, 1=right)
		border = "rounded",
		preview = {
			default = "bat",
			hidden = "hidden",
			border = "border",
			title = false,
			layout = "horizontal",
			horizontal = "right:70%",
			scrollbar = "false",
			winopts = {
				number = false,
				relativenumber = false,
				cursorline = true,
				cursorlineopt = "both",
				cursorcolumn = false,
				signcolumn = "no",
				list = false,
				foldenable = false,
				foldmethod = "manual",
			},
		},
		keymap = {
			builtin = {
				["<F1>"] = "toggle-help",
				["<F2>"] = "toggle-fullscreen",
				["<F3>"] = "toggle-preview-wrap",
				["<F4>"] = "toggle-preview",
				["<F5>"] = "toggle-preview-ccw",
				["<F6>"] = "toggle-preview-cw",
				["<S-j>"] = "preview-page-down",
				["<S-k>"] = "preview-page-up",
				["<S-h>"] = "preview-page-reset",
			},
			fzf = {
				["ctrl-z"] = "abort",
				["ctrl-u"] = "unix-line-discard",
				["ctrl-f"] = "half-page-down",
				["alt-b"] = "half-page-up",
				["ctrl-a"] = "beginning-of-line",
				["ctrl-e"] = "end-of-line",
				["alt-a"] = "toggle-all",
				["f3"] = "toggle-preview-wrap",
				["f4"] = "toggle-preview",
				["shift-j"] = "preview-page-down",
				["shift-k"] = "preview-page-up",
			},
		},
	},
})
