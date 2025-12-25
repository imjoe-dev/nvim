return {
	"nvim-mini/mini.pick",
	version = false,
	cmd = { "Pick" },
	keys = {
		{ "<leader>ff", ":Pick files<CR>", mode = "n", desc = "find files" },
		{ "<leader>fg", ":Pick grep_live<CR>", mode = "n", desc = "live grep" },
	},
	config = function()
		require("mini.pick").setup()
	end,
}
