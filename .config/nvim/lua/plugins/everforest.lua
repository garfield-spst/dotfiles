require("everforest").setup({
	---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
	background = "hard",
	---How much of the background should be transparent. 2 will have more UI
	---components be transparent (e.g. status line background)
	transparent_background_level = 0,
	italics = true,
	disable_italic_comments = false,
	---background, but you can use a grey background by setting this to `"grey"`.
	-- sign_column_background = "grey",
	---The contrast of line numbers, indent lines, etc. Options are `"high"` or
	---`"low"` (default).
	ui_contrast = "high",
	dim_inactive_windows = true,
	diagnostic_text_highlight = true,
	diagnostic_virtual_text = "coloured",
	diagnostic_line_highlight = true,
	---colored under curls will be used. If you also want to colour the foreground,
	---set this option to `true`.
	spell_foreground = false,
	show_eob = true,
	---Style used to make floating windows stand out from other windows. `"bright"`
	---makes the background of these windows lighter than |hl-Normal|, whereas
	---`"dim"` makes it darker.
	float_style = "bright",
})
vim.cmd("colorschem everforest")
vim.cmd("highlight ColorColumn ctermbg=0 guibg=#708089")
