require("nvim-surround").setup({
	opts = {
		keymaps = { -- vim-surround style keymaps
			insert = "yss",
			insert_line = "ys",
			visual = "S",
			delete = "ds",
			change = "cs",
		},
		surrounds = {
			HTML = {
				["t"] = "type", -- Change just the tag type
				["T"] = "whole", -- Change the whole tag contents
			},
			aliases = {
				["a"] = ">", -- Single character aliases apply everywhere
				["b"] = ")",
				["B"] = "}",
				["r"] = "]",
				-- Table aliases only apply for changes/deletions
				["q"] = { '"', "'", "`" }, -- Any quote character
				["s"] = { ")", "]", "}", ">", "'", '"', "`" }, -- Any surrounding delimiter
			},
		},
		highlight = { -- Highlight before inserting/changing surrounds
			duration = 2,
		},
	},
})
