local mappings = {

	n = {
		["<C-f>"] = { ":Telescope<CR>" },
		["<C-b>"] = { ":NvimTreeOpen<CR>" },

		["<C-s>"] = { ":lua vim.lsp.buf.format()<CR>" },
		["<C-\\>"] = { ":Lspsaga term_toggle<CR>" },

		["ga"] = { ":Lspsaga code_action<CR>" },
		["gh"] = { ":Lspsaga hover_doc<CR>" },
		["gf"] = { ":Lspsaga finder<CR>" },
		["gr"] = { ":Lspsaga rename<CR>" },

		["gt"] = { ":Lspsaga goto_definition<CR>" },
		["gT"] = { ":Lspsaga goto_type_definition<CR>" },

		["gd"] = { ":Lspsaga peek_definition<CR>" },
		["gD"] = { ":Lspsaga peek_type_definition<CR>" },

		["gc"] = { ":Lspsaga incomint_calls<CR>" },
		["gC"] = { ":Lspsaga outgoing_calls<CR>" },
	}
}

for mode, items in pairs(mappings) do
	for item, mapping in pairs(items) do
		vim.api.nvim_set_keymap(mode, item, mapping[1], { noremap = true, desc = mapping[2] })
	end
end
