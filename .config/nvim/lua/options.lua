local opt = vim.opt
local cmd = vim.cmd
local api = vim.api

opt.autoindent = true
opt.backup = false -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 0 -- more space in the neovim command line for displaying messages
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
opt.conceallevel = 0 -- so that `` is visible in markdown files
opt.fileencoding = "utf-8" -- the encoding written to a file
opt.hlsearch = true -- highlight all matches on previous search pattern
opt.ignorecase = true -- ignore case in search patterns
opt.mouse = "a" -- allow the mouse to be used in neovim
opt.pumheight = 10 -- pop up menu height
opt.pumblend = 10
opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
opt.showtabline = 3 -- always show tabs
opt.smartcase = true -- smart case
opt.smartindent = true -- make indenting smarter again
opt.splitbelow = true -- force all horizontal splits to go below current window
opt.splitright = true -- force all vertical splits to go to the right of current window
opt.swapfile = false -- creates a swapfile
opt.termguicolors = true -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000 -- time to wait for a mapped sequence to complete (in milliseconds)
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.updatetime = 100 -- faster completion (4000ms default)
opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
opt.expandtab = true -- convert tabs to spaces
opt.shiftwidth = 2 -- the number of spaces inserted for each indentation
opt.tabstop = 2 -- insert 2 spaces for a tab
opt.cursorline = true -- highlight the current line
opt.number = true -- set numbered lines
opt.laststatus = 3
opt.showcmd = false
opt.ruler = false
opt.relativenumber = true -- set relative numbered lines
opt.numberwidth = 4 -- set number column width to 2 {default 4}
opt.signcolumn = "yes" -- always show the sign column, otherwise it would shift the text each time
opt.wrap = false -- display lines as one long line
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.guifont = "monospace:h17" -- the font used in graphical neovim applications
opt.title = false
opt.colorcolumn = "80"
opt.showbreak = "↳⋅"
vim.wo.winhighlight = "NormalNC:WinNormalNC"
vim.wo.spell = true
vim.wo.foldenable = false
vim.wo.foldlevel = 2
vim.wo.foldmethod = "indent"
vim.wo.signcolumn = "yes:1"
vim.wo.conceallevel = 2
vim.wo.concealcursor = "n"
vim.wo.breakindent = false
vim.wo.linebreak = true
vim.o.virtualedit = "onemore"
vim.o.whichwrap = "b,h,l"
vim.o.wildmode = "longest,full"
vim.o.wildoptions = "pum"
opt.list = true
opt.listchars = {
	space = "⋅",
	-- eol = "↴",
	-- tab = "→",
	tab = ">-",
	-- tab = "▎_",
	-- tab = ">",
	trail = "•",
	extends = "❯",
	precedes = "❮",
	nbsp = "",
}
opt.fillchars = {
	fold = " ",
	foldsep = " ",
	foldopen = "",
	foldclose = "",
	diff = "╱",
}
opt.shortmess:append("W")
opt.shortmess:append("A")
opt.shortmess:append("F")

vim.g.floating_window_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
vim.g.floating_window_border_dark = {
	{ "╭", "FloatBorderDark" },
	{ "─", "FloatBorderDark" },
	{ "╮", "FloatBorderDark" },
	{ "│", "FloatBorderDark" },
	{ "╯", "FloatBorderDark" },
	{ "─", "FloatBorderDark" },
	{ "╰", "FloatBorderDark" },
	{ "│", "FloatBorderDark" },
}
vim.g.no_man_maps = true
vim.g.vim_json_syntax_conceal = false
vim.g.vim_json_conceal = false

vim.diagnostic.config({
	virtual_lines = false,
	virtual_text = {
		spacing = 3,
		prefix = " ",
		severity_sort = true,
		source = "if_many",
	},
})

cmd("highlight ColorColumn ctermbg=0 guibg=#565f89")
cmd([[syntax enable]])
cmd([[filetype plugin indent on]])
-- cmd.highlight("IndentLine guifg=#123456")
-- cmd.highlight("IndentLineCurrent guifg=#123456")

api.nvim_set_hl(0, "LineNrAbove", { fg = "#9699a3" })
api.nvim_set_hl(0, "LineNrBelow", { fg = "#9699a3" })

-- Disable some built-in plugins we don't want
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
