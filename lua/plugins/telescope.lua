return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8", -- versión estable recomendada
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	lazy = false, -- cargar al inicio
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				prompt_prefix = " ",
				selection_caret = "➤ ",
				layout_strategy = "flex",
				layout_config = { width = 0.9, preview_cutoff = 120 },
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-c>"] = actions.close,
					},
				},
			},
			pickers = {
				find_files = { hidden = false },
				live_grep = {},
				buffers = { previewer = false },
				oldfiles = {},
			},
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
		})

		telescope.load_extension("fzf")
	end,
}
