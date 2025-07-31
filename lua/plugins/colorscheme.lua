return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				flavour = "mocha",
				background = { light = "latte", dark = "mocha" },
				transparent_background = false,
				show_end_of_buffer = false,
				term_colors = false,
				dim_inactive = { enabled = false, shade = "dark", percentage = 0.15 },
				styles = {
					comments = { "italic" },
					conditionals = { "italic" },
				},
				integrations = {
					cmp = true,
					gitsigns = true,
					nvimtree = true,
					telescope = true,
					treesitter = true,
					bufferline = true,
				},
			})
			vim.cmd.colorscheme("catppuccin-mocha")
		end,
	},
}
