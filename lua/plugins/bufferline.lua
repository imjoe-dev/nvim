return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = { "VeryLazy" },
	keys = {
		{ "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "toggle pin" },
		{ "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "delete non pinned" },
		{ "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "close right" },
		{ "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "close left" },
		{ "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "close others" },
		{ "<S-h>", "<Cmd>BufferLineCyclePrev<CR>", desc = "prev buffer" },
		{ "<S-l>", "<Cmd>BufferLineCycleNext<CR>", desc = "next buffer" },
		{ "[B", "<Cmd>BufferLineMovePrev<CR>", desc = "move buffer prev" },
		{ "]B", "<Cmd>BufferLineMoveNext<CR>", desc = "move buffer next" },
	},
	opts = {
		options = {
			offsets = {
				{
					filetype = "NvimTree",
					text = "File Explorer",
					text_align = "center",
					separator = true,
				},
			},
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)
	end,
}
