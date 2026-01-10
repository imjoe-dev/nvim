return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "format buffer",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofumpt" },
			javascript = { "oxlint", "oxfmt" },
			typescript = { "oxlint", "oxfmt" },
			javascriptreact = { "oxlint", "oxfmt" },
			typescriptreact = { "oxlint", "oxfmt" },
		},
		format_on_save = { timeout_ms = 500 },
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
