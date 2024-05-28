local highlight = {
	"RainbowRed",
	"RainbowYellow",
	"RainbowBlue",
	"RainbowOrange",
	"RainbowGreen",
	"RainbowViolet",
	"RainbowCyan",
}
local api = vim.api
local hooks = require("ibl.hooks")
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
	api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
	api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
	api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
	api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
	api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
	api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
	api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }
require("ibl").setup({
	scope = {
		highlight = highlight,
		char = "┊",
		show_start = true,
		show_end = true,
	},
	exclude = {
		filetypes = {
			"help",
			"alpha",
			"dashboard",
			"neo-tree",
			"Trouble",
			"trouble",
			"lazy",
			"mason",
			"notify",
			"toggleterm",
			"lazyterm",
			"JABSOpen",
			"jabs",
			"oil",
		},
		buftypes = { "fzf", "help", "terminal", "nofile" },
	},
})

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
