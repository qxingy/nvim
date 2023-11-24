local mappings = {
    n = {
	["<C-f>"] = { ":Telescope<CR>", "open the telescope"},
	["<C-b>"] = { ":NvimTreeOpen<CR>", "open the NvimTree"},
    }
}

print("starting ... ")
for mode , items in pairs(mappings) do
    for item , mapping in pairs(items) do
	vim.api.nvim_set_keymap(mode,item,mapping[1],{noremap=true, desc=mapping[2]})
    end
end
