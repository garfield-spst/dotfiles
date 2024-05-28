require("stabline").setup({
	font_active = "bold",
	font_inactive = "italic",
	stab_start = "%#Identifier# ",
	-- stab_bg = "none",
	-- stab_left = "",
	inactive_fg = "#C7C7CA",
	fg = "#54CED6",
	numbers = function(bufn, n)
		return n .. " "
	end,
})
