local M = {
	"github/copilot.vim",
	"nvim-tree/nvim-web-devicons",
	"nvim-lua/plenary.nvim",

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{
		"folke/tokyonight.nvim",
        opts = {
            transparent = true,
            styles = {
                sidebars = "transparent"
            }
        },
		init = function()
            vim.cmd "colorscheme tokyonight"
		end
	},
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
