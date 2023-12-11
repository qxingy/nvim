function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local mappings = {
	[""] = {
		["<C-s>"] = { "<Esc>:lua vim.lsp.buf.format()<CR>" },
		["<leader>n"] = { "<Esc>:tabnext<CR>" },
		["<leader>p"] = { "<Esc>:tabprevious<CR>" },
	},

	["i"] = {
		["<C-s>"] = { "<Esc>:lua vim.lsp.buf.format()<CR> :w<CR>" },
	},

	["n"] = {
		["<leader>f"] = { ":Telescope<CR>" },
		["<leader>b"] = { ":NvimTreeOpen<CR>" },
		["<leader>\\"] = { ":ToggleTerm<CR>" },

		["ga"] = { ":Lspsaga code_action<CR>" },
		["gh"] = { ":Lspsaga hover_doc<CR>" },
		["gf"] = { ":Lspsaga finder<CR>" },
		["gr"] = { ":Lspsaga rename<CR>" },

		["gt"] = { ":Lspsaga goto_definition<CR>" },
		["gT"] = { ":Lspsaga goto_type_definition<CR>" },

		["gd"] = { ":lua vim.lsp.buf.definition()<CR>" },

		["gc"] = { ":Lspsaga incomint_calls<CR>" },
		["gC"] = { ":Lspsaga outgoing_calls<CR>" },
	},
}

for mode, items in pairs(mappings) do
	for item, mapping in pairs(items) do
		vim.api.nvim_set_keymap(mode, item, mapping[1], { noremap = true, desc = mapping[2] })
	end
end
