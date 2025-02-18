local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function(_, opt)
			require("nvim-treesitter.configs").setup(opt)
		end,
		opts = {
			ensure_installed = { "c", "lua", "go", "markdown", "markdown_inline", "python" },
			auto_install = true,
			highlight = { enable = true },
		},
	},
}

return M
