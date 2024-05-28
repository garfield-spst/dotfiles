local wezterm = require("wezterm")
local config = {
	-- default_prog = { "zellij", "-l", "welcome" },
	enable_tab_bar = false,
	font = wezterm.font("ComicShannsMono Nerd Font", { weight = "Regular", italic = false }),
	font_size = 22,
	color_scheme = "Everforest Dark (Gogh)",
	colors = {
		background = "#272E33",
	},
	window_padding = {
		left = "0cell",
		right = "0cell",
		top = "0cell",
		bottom = "0cell",
	},
	window_frame = {
		border_left_width = "0.25cell",
		border_right_width = "0.25cell",
		border_bottom_height = "0.05cell",
		border_top_height = "0.20cell",
	},
	hide_mouse_cursor_when_typing = true,
	window_close_confirmation = "NeverPrompt",
	keys = {
		{ key = "l", mods = "ALT", action = wezterm.action.ShowLauncher },
	},
	automatically_reload_config = true,
	--enable_wayland = false,
}

return config
