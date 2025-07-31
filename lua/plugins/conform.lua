return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	opts = {
		format_on_save = {
			timeout_ms = 500,
			lsp_fallback = true, -- Usa LSP si no hay formateador externo
		},
		formatters_by_ft = {
			lua = { "stylua" },
			go = { "gofmt" },
			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			c = { "clang_format" },
			cpp = { "clang_format" },
		},
	},
}
