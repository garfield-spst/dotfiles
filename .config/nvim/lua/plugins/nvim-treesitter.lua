require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "markdown", "markdown_inline", "bash", "python", "go", "gomod", "gowork", "gosum" },
	highlight = { enable = true },
	indent = { enable = true },
})
