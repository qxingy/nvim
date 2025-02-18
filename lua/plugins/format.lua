local M = {
	{
		"stevearc/conform.nvim",
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
			},
			format_on_save = {
				time_ms = 500,
				lsp_format = "fallback",
			},
		},
	},
}

return M
