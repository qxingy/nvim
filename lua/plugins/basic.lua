local M = {
	{
		"nvim-tree/nvim-web-devicons",
		opts = {}
	},
	{
		"navarasu/onedark.nvim",
		opts = {
			style = "darker",
		},
		init = function()
			vim.cmd "colorscheme onedark"
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
					".git"
				}
			}

		}
	},
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			theme = "auto"
		}
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {}
	},
	{
		"akinsho/toggleterm.nvim",
		opts = {
			direction = "float",
			hidden = true,
		}
	}
}

return M
