return {
	"rcarriga/nvim-notify",
	lazy = false,
	config = function()
		local notify = require("notify")

		notify.setup({
			background_colour = "#000000", -- evita parpadeo visual
			render = "default",
			stages = "fade_in_slide_out",
			timeout = 3000,
		})

		vim.notify = notify
	end,
}
