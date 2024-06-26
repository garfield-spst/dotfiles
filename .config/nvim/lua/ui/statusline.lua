local present, feline = pcall(require, "feline")
if not present then
	return
end

local function isRecording()
	local reg = vim.fn.reg_recording()
	if reg == "" then
		return ""
	else
		return "RECORD @ " .. reg
	end
end

local function buffs()
	local result = {}
	for _, val in ipairs(vim.fn.range(1, vim.fn.bufnr("$"))) do
		if vim.fn.bufexists(val) == 1 and vim.fn.bufname(val) ~= "" then
			local buffer_number = tostring(val)
			local buffer_name = vim.fn.fnamemodify(vim.fn.bufname(val), ":t")
			local buffer_icon = ""
			table.insert(result, buffer_icon .. " " .. buffer_number .. ":" .. buffer_name .. " ")
		end
	end
	return table.concat(result, "")
end

-- Customizations {{{
local theme = {
	aqua = "#7AB0DF",
	bg = "NONE",
	blue = "#6272A4",
	cyan = "#7FBBB3",
	darkred = "#FB7373",
	fg = "#D5C9AB",
	gray = "#272E33",
	green = "#A7C080",
	lime = "#54CED6",
	orange = "#E69875",
	pink = "#D997C8",
	purple = "#D196B3",
	red = "#ED8082",
	yellow = "#FFE59E",
}

local mode_theme = {
	["NORMAL"] = theme.green,
	["OP"] = theme.cyan,
	["INSERT"] = theme.aqua,
	["VISUAL"] = theme.yellow,
	["LINES"] = theme.darkred,
	["BLOCK"] = theme.orange,
	["REPLACE"] = theme.purple,
	["V-REPLACE"] = theme.pink,
	["ENTER"] = theme.pink,
	["MORE"] = theme.pink,
	["SELECT"] = theme.darkred,
	["SHELL"] = theme.cyan,
	["TERM"] = theme.lime,
	["NONE"] = theme.gray,
	["COMMAND"] = theme.blue,
}

local modes = setmetatable({
	["n"] = "N",
	["no"] = "N",
	["v"] = "V",
	["V"] = "VL",
	-- [""] = "VB",
	["s"] = "S",
	["S"] = "SL",
	[""] = "SB",
	["i"] = "I",
	["ic"] = "I",
	["R"] = "R",
	["Rv"] = "VR",
	["c"] = "C",
	["cv"] = "EX",
	["ce"] = "X",
	["r"] = "P",
	["rm"] = "M",
	["r?"] = "C",
	["!"] = "SH",
	["t"] = "T",
}, {
	__index = function()
		return "-"
	end,
})
-- }}}

-- Components {{{
local component = {}

component.vim_mode = {
	provider = function()
		return modes[vim.api.nvim_get_mode().mode]
	end,
	hl = function()
		return {
			fg = "gray",
			bg = require("feline.providers.vi_mode").get_mode_color(),
			style = "bold",
			name = "NeovimModeHLColor",
		}
	end,
	left_sep = "block",
	right_sep = "block",
}

component.context = {
	hl = {
		fg = "#D997C8",
	},
	left_sep = " ",
	right_sep = " ",
}

component.git_branch = {
	provider = "git_branch",
	hl = {
		fg = "fg",
		bg = "bg",
		style = "bold",
	},
	left_sep = " ",
	right_sep = "",
}

component.git_add = {
	provider = "git_diff_added",
	hl = {
		fg = "green",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.git_delete = {
	provider = "git_diff_removed",
	hl = {
		fg = "red",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.git_change = {
	provider = "git_diff_changed",
	hl = {
		fg = "purple",
		bg = "bg",
	},
	left_sep = "",
	right_sep = "",
}

component.separator = {
	provider = "",
	hl = {
		-- fg = "bg",
		-- bg = "bg",
	},
}

component.diagnostic_errors = {
	provider = "diagnostic_errors",
	hl = {
		fg = "red",
	},
}

component.diagnostic_warnings = {
	provider = "diagnostic_warnings",
	hl = {
		fg = "yellow",
	},
}

component.diagnostic_hints = {
	provider = "diagnostic_hints",
	hl = {
		fg = "aqua",
	},
}

component.diagnostic_info = {
	provider = "diagnostic_info",
}

component.lsp = {
	provider = function()
		if not rawget(vim, "lsp") then
			return ""
		end

		local progress = vim.lsp.status()[1]
		if vim.o.columns < 120 then
			return ""
		end

		local clients = vim.lsp.get_active_clients({ bufnr = 0 })
		if #clients ~= 0 then
			if progress then
				local spinners = {
					"◜ ",
					"◠ ",
					"◝ ",
					"◞ ",
					"◡ ",
					"◟ ",
				}
				local ms = vim.loop.hrtime() / 1000000
				local frame = math.floor(ms / 120) % #spinners
				local content = string.format("%%<%s", spinners[frame + 1])
				return content or ""
			else
				return "לּ LSP"
			end
		end
		return ""
	end,
	hl = function()
		local progress = vim.lsp.status()[1]
		return {
			fg = progress and "yellow" or "green",
			bg = "bg",
			style = "bold",
		}
	end,
	left_sep = "",
	right_sep = " ",
}

component.file_type = {
	provider = {
		name = "file_type",
		opts = {
			filetype_icon = true,
		},
	},
	hl = {
		fg = "fg",
		bg = "bg",
	},
	left_sep = " ",
	right_sep = " ",
}

component.vim_macro = {
	provider = function()
		return isRecording()
	end,
	hl = {
		fg = "#F87070",
	},
	left_sep = " ",
	right_sep = " ",
}

component.buffs = {
	provider = function()
		return buffs()
	end,
	hl = {
		fg = "#D5C9AB",
	},
}

component.buffer_name = {
	provider = "file_info",
	hl = {
		fg = "fg",
		bg = "bg",
	},
	left_sep = " ",
	right_sep = " ",
}

component.total_lines = {
	provider = function()
		return "" .. vim.api.nvim_buf_line_count(0)
		-- return " " .. vim.api.nvim_buf_line_count(0) .. " lines "
	end,
	hl = {
		fg = "#7FBBB3",
	},
	left_sep = " ",
	-- right_sep = "block",
}

component.scroll_bar = {
	provider = function()
		local chars = setmetatable({
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
			" ",
		}, {
			__index = function()
				return " "
			end,
		})
		local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
		local position = math.floor(line_ratio * 100)

		local icon = chars[math.floor(line_ratio * #chars)] .. position
		if position <= 5 then
			icon = " TOP"
		elseif position >= 95 then
			icon = " BOT"
		end
		return icon
	end,
	hl = function()
		local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
		local fg
		local style

		if position <= 5 then
			fg = "aqua"
			style = "bold"
		elseif position >= 95 then
			fg = "red"
			style = "bold"
		else
			fg = "purple"
			style = nil
		end
		return {
			fg = fg,
			style = style,
			bg = "bg",
		}
	end,
	left_sep = " ",
	right_sep = " ",
}
-- }}}

-- Arrangements -- {{{
vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", fg = "#7AB0DF" })
feline.setup({
	components = {
		active = {
			{ -- left
				component.vim_mode,
				component.git_branch,
				component.git_add,
				component.git_delete,
				component.git_change,
				component.diagnostic_errors,
				component.diagnostic_warnings,
				component.diagnostic_info,
				component.diagnostic_hints,
				-- component.separator,
			},
			{ -- middle
				component.vim_macro,
				component.lsp,
				component.context,
			},
			{ -- right
				-- component.separator,
				-- component.buffs,
				component.scroll_bar,
				-- component.buffer_name,
				component.total_lines,
			},
		},
	},
	theme = theme,
	vi_mode_colors = mode_theme,
})
