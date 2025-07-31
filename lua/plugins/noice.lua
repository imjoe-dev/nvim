return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				progress = { enabled = true },
				hover = { enabled = true },
				signature = { enabled = true },
				message = { enabled = true },
			},
			messages = {
				enabled = true,
				view_search = "virtualtext",
			},
			popupmenu = {
				enabled = true,
				backend = "nui",
			},
			cmdline = {
				enabled = true,
				view = "cmdline_popup",
			},
			views = {
				cmdline_popup = {
					position = {
						row = 5,
						col = "50%",
					},
					size = {
						width = 60,
						height = "auto",
					},
					border = {
						style = "rounded",
					},
				},
			},
			presets = {
				bottom_search = true,
				command_palette = true,
				long_message_to_split = true,
			},
		})
	end,
}
