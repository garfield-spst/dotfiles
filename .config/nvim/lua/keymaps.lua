local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "<Space>", "", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Custom mappings
keymap("n", "<C-s>", ":w <CR>", { noremap = true })
keymap("n", "<C-i>", "<C-i>", opts)
keymap("n", "<leader><leader>", ":noh <CR>", opts)

-- Moving line up and down in visual mode
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '>-2<CR>gv=gv", opts)

-- Easy split generation
keymap("n", "<leader>v", ":vsplit <CR>", opts)
keymap("n", "<leader>x", ":split <CR>", opts)
keymap("n", "<leader>q", ":bd! <CR>", opts)

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
keymap("n", "<C-x>", "<C-w>c", opts)

keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)
keymap("n", "#", "#zz", opts)
keymap("n", "g*", "g*zz", opts)
keymap("n", "g#", "g#zz", opts)

-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("x", "p", [["_dP]])

vim.cmd([[:amenu 10.100 mousemenu.Goto\ Definition <cmd>lua vim.lsp.buf.definition()<CR>]])
vim.cmd([[:amenu 10.110 mousemenu.References <cmd>lua vim.lsp.buf.references()<CR>]])
-- vim.cmd [[:amenu 10.120 mousemenu.-sep- *]]

vim.keymap.set("n", "<RightMouse>", "<cmd>:popup mousemenu<CR>")
vim.keymap.set("n", "<Tab>", "<cmd>:popup mousemenu<CR>")

-- more good
keymap({ "n", "o", "x" }, "<s-h>", "^", opts)
keymap({ "n", "o", "x" }, "<s-l>", "g_", opts)

-- Fzf
-- keymap("n", "<leader>f", "<CMD>FZF<CR>", opts)
-- keymap("n", "<leader>F", "<CMD>FZFDir<CR>", opts)

-- Telescope Keymaps
-- keymap("n", "<C-p>", ":Telescope find_files follow=true no_ignore=true hidden=true<CR>", opts)
-- keymap("n", "<leader>/", "<CMD>Telescope live_grep<CR>", opts)
-- keymap("n", "<leader>\\", "<CMD>Telescope current_buffer_fuzzy_find<CR>", opts)
-- keymap("n", "<leader>b", ":Telescope buffers <CR>", opts)
-- keymap("n", "<leader>o", ":Telescope oldfiles <CR>", opts)
-- keymap("n", "<leader>u", ":UndotreeToggle <CR>", opts)

-- Fzf Lua Keymaps
keymap("n", "<C-p>", "<CMD>FzfLua files<CR>", opts)
keymap("n", "<leader>l", "<CMD>FzfLua blines<CR>", opts)
keymap("n", "<leader>/", "<CMD>FzfLua lines<CR>", opts)
keymap("n", "<leader>b", ":FzfLua buffers <CR>", opts)
keymap("n", "<leader>o", ":FzfLua oldfiles <CR>", opts)
keymap("n", "<F3>", ":FzfLua <CR>", opts)
keymap("n", "<leader>u", ":UndotreeToggle <CR>", opts)

-- Nvim Dap Keymaps
keymap("n", "<leader>du", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end, opts)
keymap("n", "<leader>dgt", ":lua require('dap-go').debug_test()<CR>", opts)
keymap("n", "<leader>dgl", ":lua require('dap-go').debug_last()<CR>", opts)
keymap("n", "<leader>dp", ":lua require('dap-python').test_method()<CR>", opts)
keymap("n", "<leader>db", ":DapToggleBreakpoint<CR>", opts)

-- Neo Tree Keymaps
-- keymap("n", "<leader>n", "<CMD>NnnExplorer %:p:h<CR>", opts)
keymap("n", "<leader>n", "<CMD>SidebarNvimToggle<CR>", opts)
-- keymap("n", "<leader>n", "<CMD>NvimTreeOpen<CR>", opts)

-- Define key mappings to switch to specific buffers
for i = 1, 9 do
	local map_key = "<M-" .. i .. ">"
	keymap("n", map_key, ':lua require("nvim-smartbufs").goto_buffer(' .. i .. ")<CR>", { remap = true, silent = true })
end

-- Define key mappings to close specific buffers
for i = 1, 9 do
	local map_key = "<C-" .. i .. ">"
	keymap(
		"n",
		map_key,
		':lua require("nvim-smartbufs").close_buffer(' .. i .. ")<CR>",
		{ remap = true, silent = true }
	)
end
