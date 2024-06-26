return {
	on_init = function(client)
		client.server_capabilities.semanticTokensProvider = nil
	end,
	cmd = { "gopls" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	root_dir = require("lspconfig.util").root_pattern("go.mod", ".git", "go.work"),
	settings = {
		gopls = {
			gofumpt = false,
			codelenses = {
				gc_details = false,
				generate = false,
				regenerate_cgo = true,
				run_govulncheck = true,
				test = true,
				tidy = false,
				upgrade_dependency = false,
				vendor = false,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				constantValues = true,
				functionTypeParameters = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			analyses = {
				fieldalignment = true,
				nilness = true,
				unusedparams = true,
				unusedwrite = true,
				useany = true,
			},
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true,
			directoryFilters = { "-.bob", "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
			semanticTokens = true,
		},
	},
}
