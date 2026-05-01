return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		preset = "modern",
		delay = 400,
		spec = {
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>b", group = "buffer" },
			{ "<leader>y", desc = "Yank to clipboard" },
			{ "<leader>p", desc = "Paste from clipboard" },
			{ "<leader>w", desc = "Write" },
			{ "<leader>q", desc = "Quit" },
			{ "<leader>h", desc = "Clear search highlight" },
		},
	},
}
