function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local function map(mode, lhs, rhs, opts)
	opts = opts or { noremap = true }
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

map("", "<C-s>", "<Esc>:lua vim.lsp.buf.format()<CR>")
map("", "<leader>n", "<Esc>:tabnext<CR>")
map("", "<leader>p", "<Esc>:tabprevious<CR>")

map("i", "<C-s>", "<Esc>:lua vim.lsp.buf.format()<CR> :w<CR>")

map("n", "<leader>f", ":Telescope<CR>")
map("n", "<leader>b", ":NvimTreeOpen<CR>")
map("n", "t\\", "ToggleTerm<CR>")
map("n", "ga", ":Lspsaga code_action<CR>")
map("n", "gh", ":Lspsaga hover_doc<CR>")
map("n", "gf", ":Lspsaga finder<CR>")
map("n", "gr", ":Lspsaga rename<CR>")
map("n", "gt", ":Lspsaga goto_definition<CR>")
map("n", "gT", ":Lspsaga goto_type_definition<CR>")
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>")
map("n", "gc", "Lspsaga incomint_calls<CR>")
map("n", "gC", "Lspsaga outgoing_calls<CR>")
