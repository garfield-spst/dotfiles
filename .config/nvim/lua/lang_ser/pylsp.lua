return {
	settings = {
		pylsp = {
			-- "flake8", "pylint", "pycodestyle", "pylsp_mypy", "pyls_isort"
			configurationSources = { "black" },
			plugins = {
				black = { enabled = true },
				flake8 = {
					enabled = false,
					maxLineLength = 200,
					extendIgnore = {
						"W503",
						"E501",
						"C812",
					},
				},
				pylint = {
					enabled = true,
					executable = "pylint",
					args = {
						"--max-line-length=200",
						"--disable=C0115,C0301,C0114,W0611,E0401,E0501,E0611",
					},
				},
				pycodestyle = { enabled = false },
				pylsp_mypy = { enabled = false },
				pyls_isort = { enabled = true },
			},
		},
	},
}
