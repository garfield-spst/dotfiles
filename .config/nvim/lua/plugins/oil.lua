require("oil").setup({
	opts = {
		default_file_explorer = true,
		skip_confirm_for_simple_edits = true,
		prompt_save_on_select_new_entry = false,
		columns = {
			"icon",
			--"permissions",
			-- "size",
			--"mtime",
		},
	},
	float = {
		max_height = 20,
		max_width = 40,
		border = "double",
		win_options = {
			winblend = 0,
		},
		override = function(conf)
			return conf
		end,
	},
	keymaps = {
		["?"] = "actions.show_help",
		["<CR>"] = "actions.select",
		["v"] = "actions.select_vsplit",
		["h"] = "actions.select_split",
		["t"] = "actions.select_tab",
		["<C-p>"] = "actions.preview",
		["<C-c>"] = "actions.close",
		["q"] = "actions.close",
		["<C-l>"] = "actions.refresh",
		["-"] = "actions.parent",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = "actions.tcd",
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
	use_default_keymaps = false,
})
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory" })
