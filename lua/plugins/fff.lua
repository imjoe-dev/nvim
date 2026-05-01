return {
	"dmtrKovalenko/fff.nvim",
	lazy = false,
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	keys = {
		{ "<leader>ff", function() require("fff").find_files() end, desc = "Find files" },
		{ "<leader>fg", function() require("fff").live_grep() end, desc = "Live grep" },
		{ "<leader>fz", function() require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } }) end, desc = "Fuzzy grep" },
		{ "<leader>fw", function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end, desc = "Grep word under cursor" },
	},
	opts = {
		layout = {
			height = 0.8,
			width = 0.8,
			prompt_position = "bottom",
			preview_position = "right",
			preview_size = 0.5,
		},
		preview = {
			enabled = true,
			line_numbers = true,
		},
		git = {
			status_text_color = true,
		},
		grep = {
			smart_case = true,
			modes = { "plain", "regex", "fuzzy" },
		},
		frecency = {
			enabled = true,
		},
		history = {
			enabled = true,
		},
	},
}
