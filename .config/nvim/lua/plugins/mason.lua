local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
	ui = {
		icons = {
			package_pending = " ",
			package_installed = "󰄳 ",
			package_uninstalled = " 󰚌",
		},

		keymaps = {
			toggle_server_expand = "<CR>",
			install_server = "i",
			update_server = "u",
			check_server_version = "c",
			update_all_servers = "U",
			check_outdated_servers = "C",
			uninstall_server = "X",
			cancel_installation = "<C-c>",
		},
	},
})

mason_lspconfig.setup({
	ensure_installed = { "gopls", "lua_ls", "pylsp" },
	handlers = {
		pylsp = function()
			lspconfig.pylsp.setup(require("lang_ser.pylsp"))
		end,
		gopls = function()
			lspconfig.gopls.setup(require("lang_ser.gopls"))
		end,
		lua_ls = function()
			lspconfig.lua_ls.setup(require("lang_ser.lua_ls"))
		end,
		tsserver = function()
			lspconfig.tsserver.setup({})
		end,
		bashls = function()
			lspconfig.bashls.setup({})
		end,
		yamlls = function()
			lspconfig.yamlls.setup({
				settings = {
					yaml = {
						schemas = {
							["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
							["../path/relative/to/file.yml"] = "/.github/workflows/*",
							["/path/from/root/of/project"] = "/.github/workflows/*",
						},
					},
				},
			})
		end,
	},
})
