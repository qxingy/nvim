require("basic")
require("mappings")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
	"git",
	"clone",
	"--filter=blob:none",
	"https://github.com/folke/lazy.nvim.git",
	"--branch=stable",
	lazypath
    })
end

vim.opt.rtp:prepend(lazypath)

local plugin = {
    { "folke/tokyonight.nvim", priority = 1001, init = function() vim.cmd "colorscheme tokyonight" end },
    { 
	"neovim/nvim-lspconfig", 
	priority = 1000,
	config = function()
	    require("lspconfig").gopls.setup() 
	end
    },
    {
	"williamboman/mason-lspconfig",
	opts = { ensure_installed = { "lua_ls" } },
	dependencies = {
	    {
		"williamboman/mason.nvim",
		opts = {
		},
	    },
	},
    },

    { "nvim-tree/nvim-web-devicons"},
    { "nvim-tree/nvim-tree.lua", opts={} },
    { "nvim-lualine/lualine.nvim", opts={theme="auto"} },
    { "utilyre/barbecue.nvim", opts={}, dependencies = {"SmiteshP/nvim-navic"} },
    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts={} },
    {
	"nvim-treesitter/nvim-treesitter",
	config = function(_, opt)
	    require "nvim-treesitter.configs".setup(opt)
	end,
	opts = {
	    ensure_installed = {"lua"},
	    auto_install = true,
	    highlight = {
		enable = true,
	    },
	}
    },
    {
	"hrsh7th/nvim-cmp",
	opts = function()
	    local cmp = require("cmp")
	    return {
		snippet = {
		    expand = function(args)
			require("luasnip").lsp_expand(args.body)
		    end
		},
		sources = cmp.config.sources {{ name = "nvim_lsp" },{ name = "luasnip" }},
	    }
	end,
	config = function(_, opts)
	    local cmp = require("cmp")
	    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
	    cmp.event:on("confirm_done",cmp_autopairs.on_confirm_done())

	    local capabilities = require("cmp_nvim_lsp").default_capabilities()
	    require("lspconfig").lua_ls.setup {settings = {
		capabilities = capabilities,
	    }}
	    cmp.setup(opts)
	end,
	dependencies = {
	    "L3MON4D3/LuaSnip",
	    "hrsh7th/cmp-nvim-lsp",
	    "hrsh7th/cmp-buffer",
	    "hrsh7th/cmp-path",
	    "hrsh7th/cmp-cmdline",
	    { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} }
	}
    },
    {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" }
    },
    {
	"folke/which-key.nvim",
	opts = {},
	event = "VeryLazy",
	init = function()
	    vim.o.timeout = true
	    vim.o.timeoutlen = 300
	end
    }
}

require("lazy").setup(plugin)
