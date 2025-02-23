function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
	vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local function map(mode, lhs, rhs, opts)
	opts = opts or { noremap = true }
	vim.api.nvim_set_keymap(mode, lhs, rhs, opts)
end

map("", "<leader>n", "<Esc>:tabnext<CR>")
map("", "<leader>p", "<Esc>:tabprevious<CR>")

map("n", "<leader>/", ":Telescope find_files<CR>")
map("n", "<leader>ff", ":Telescope find_files<CR>")
map("n", "<leader>fg", ":Telescope live_grep<CR>")
map("n", "<leader>fb", ":Telescope buffers<CR>")
map("n", "<leader>fh", ":Telescope help tags<CR>")

map("n", "<leader>b", ":NvimTreeOpen<CR>")
map("n", "<leader>t", "ToggleTerm<CR>")

-- Move to previous/next
map("n", "<A-,>", "<Cmd>BufferPrevious<CR>")
map("n", "<A-.>", "<Cmd>BufferNext<CR>")
-- Re-order to previous/next
map("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>")
map("n", "<A->>", "<Cmd>BufferMoveNext<CR>")
-- Goto buffer in position...
map("n", "<A-1>", "<Cmd>BufferGoto 1<CR>")
map("n", "<A-2>", "<Cmd>BufferGoto 2<CR>")
map("n", "<A-3>", "<Cmd>BufferGoto 3<CR>")
map("n", "<A-4>", "<Cmd>BufferGoto 4<CR>")
map("n", "<A-5>", "<Cmd>BufferGoto 5<CR>")
map("n", "<A-6>", "<Cmd>BufferGoto 6<CR>")
map("n", "<A-7>", "<Cmd>BufferGoto 7<CR>")
map("n", "<A-8>", "<Cmd>BufferGoto 8<CR>")
map("n", "<A-9>", "<Cmd>BufferGoto 9<CR>")
map("n", "<A-0>", "<Cmd>BufferLast<CR>")
-- Pin/unpin buffer
map("n", "<A-p>", "<Cmd>BufferPin<CR>")
-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned
-- Close buffer
map("n", "<A-c>", "<Cmd>BufferClose<CR>")
-- Wipeout buffer
--                 :BufferWipeout
-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight
-- Magic buffer-picking mode
map("n", "<C-p>", "<Cmd>BufferPick<CR>")
-- Sort automatically by...
map("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>")
map("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>")
map("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>")
map("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>")
map("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>")

map("n", "<leader>t", "<Cmd>belowright split | term<CR>a")
