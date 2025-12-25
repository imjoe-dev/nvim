return {
	"nvim-mini/mini.completion",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{
			"nvim-mini/mini.icons",
			config = function()
				require("mini.icons").setup()

				MiniIcons.mock_nvim_web_devicons()
				MiniIcons.tweak_lsp_kind()
			end,
		},
		{
			"nvim-mini/mini.snippets",
			config = function()
				require("mini.snippets").setup()
			end,
		},
	},
	config = function()
		local process_items_opts = { kind_priority = { Text = -1, Snippet = 99 } }
		local process_items = function(items, base)
			return MiniCompletion.default_process_items(items, base, process_items_opts)
		end

		require("mini.completion").setup({
			lsp_completion = {
				source_func = "omnifunc",
				auto_setup = false,
				process_items = process_items,
			},
		})

		local on_attach = function(ev)
			vim.bo[ev.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"
		end

		vim.api.nvim_create_autocmd({ "LspAttach" }, {
			callback = on_attach,
		})

		vim.lsp.config("*", { capabilities = MiniCompletion.get_lsp_capabilities() })
	end,
}
