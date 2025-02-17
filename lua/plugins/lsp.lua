-- test
function test() 
end

test()

local M = {
	{
		"nvim-treesitter/nvim-treesitter",
		config = function(_, opt)
			require "nvim-treesitter.configs".setup(opt)
		end,
		opts = {
			ensure_installed = { "c", "lua", "go", "markdown", "markdown_inline","python" }, auto_install = true, highlight = { enable = true, },
		}
	},
	{
		"williamboman/mason-lspconfig",
		dependencies = {
			{ "williamboman/mason.nvim" },
		},
	},
	{
		"neovim/nvim-lspconfig",
		cmd = 'LspInfo',
		event = { 'BufReadPre', 'BufNewFile' },
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
		},
		init = function()
			-- Reserve a space in the gutter
			-- This will avoid an annoying layout shift in the screen
			vim.opt.signcolumn = 'yes'
		end,
		config = function()
			local lsp_defaults = require('lspconfig').util.default_config

			-- Add cmp_nvim_lsp capabilities settings to lspconfig
			-- This should be executed before you configure any language server
			lsp_defaults.capabilities = vim.tbl_deep_extend(
				'force',
				lsp_defaults.capabilities,
				require('cmp_nvim_lsp').default_capabilities()
			)

			-- LspAttach is where you enable features that only work
			-- if there is a language server active in the file
			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP actions',
				callback = function(event)
					local opts = { buffer = event.buf }

					vim.keymap.set('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
					vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
					vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
					vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
					vim.keymap.set('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
					vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
					vim.keymap.set('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
					vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
					vim.keymap.set({ 'n', 'x' }, '<F3>',
						'<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
					vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
				end,
			})

			require('lspconfig').lua_ls.setup({})
		end
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
				mapping = {
					["<C-p>"] = cmp.mapping.scroll_docs(-1),
					["<C-n>"] = cmp.mapping.scroll_docs(1),
					["<CR>"] = cmp.mapping.complete(),
				},
				sources = cmp.config.sources(
					{ { name = "nvim_lsp" } }
				),
			}
		end,
	},
	{ "numToStr/Comment.nvim",         opts = {},                                 lazy = fase },
	{ "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
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

return M
