local M = {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"navarasu/onedark.nvim",
		opts = {
			transparent = true,
			style = "darker",
		},
		init = function()
			vim.cmd("colorscheme onedark")
		end,
	},
	-- {
	-- 	"folke/tokyonight.nvim",
	-- 	init = function()
	-- 		vim.cmd "colorscheme tokyonight"
	-- 	end
	-- },
	{
		"nvim-tree/nvim-tree.lua",
		opts = {
			diagnostics = {
				enable = true,
				show_on_dirs = true,
			},
			filters = {
				custom = {
					".git",
				},
			},
		},
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "auto",
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			hidden = true,
		},
	},
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim",
			"nvim-tree/nvim-web-devicons",
		},
		init = function()
			vim.g.barbar_auto_setup = false
		end,
	},
	{ "numToStr/Comment.nvim", opts = {}, lazy = fase },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
	{
		"folke/which-key.nvim",
		opts = {},
		event = "VeryLazy",
		init = function()
			vim.opt.timeout = true
			vim.opt.timeoutlen = 300
		end,
	},
}

return M
