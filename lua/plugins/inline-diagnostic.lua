return {
	"rachartier/tiny-inline-diagnostic.nvim",
	event = "VeryLazy",
	priority = 1000,
	opts = {
		options = {
			add_messages = {
				display_count = true,
			},
			multilines = { enabled = true },
			show_source = {
				enabled = true,
			},
		},
	},
	config = function(_, opts)
		require("tiny-inline-diagnostic").setup(opts)
		vim.diagnostic.config({ virtual_text = false })

		vim.keymap.set("n", "<leader>dt", "<Cmd>TinyInlineDiag toggle<CR>")
	end,
}
