return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("bufferline").setup({
			options = {
				mode = "buffers",
				numbers = "none",
				diagnostics = "nvim_lsp",
				separator_style = "slant",
				offsets = {
					{
						filetype = "NvimTree",
						text = "File Explorer",
						text_align = "center",
						separator = true,
					},
				},
				show_buffer_close_icons = true,
				show_close_icon = false,
				always_show_bufferline = true,
			},
		})

		vim.cmd("colorscheme catppuccin")
	end,
}
