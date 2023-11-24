local mappings = {
    
    n = {
	["<C-f>"] = {":Telescope<CR>"},
	["<C-b>"] = {":NvimTreeOpen<CR>"},

	["gd"] = {":lua vim.lsp.buf.definition()<CR>"},
	["gh"] = {":lua vim.lsp.buf.hover()<CR>"},
	["gi"] = {":lua vim.lsp.buf.implementation()<CR>"},
	["gD"] = {":lua vim.lsp.buf.declaration()<CR>"},
	["gr"] = {":lua vim.lsp.buf.references()<CR>"},

	["<C-i>"] = {":lua vim.lsp.buf.code_action()<CR>"},
	["<C-s>"] = {":lua vim.lsp.buf.format()<CR>"}
    }
}

for mode , items in pairs(mappings) do
    for item , mapping in pairs(items) do
	vim.api.nvim_set_keymap(mode,item,mapping[1],{noremap=true, desc=mapping[2]})
    end
end
