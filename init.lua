require("basic")
require("mappings")

local utils = require("utils")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = utils.merge({
	require("plugins/basic"),
	require("plugins/lsp"),
	require("plugins/format"),
	require("plugins/treesitter"),
})

require("lazy").setup(plugins)
