return {
	{
		"nvim-treesitter/nvim-treesitter",
		version = false,
		build = ":TSUpdate",
		lazy = false,
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"bash",
					"c",
					"cpp",
					"lua",
					"vim",
					"vimdoc",
					"json",
					"markdown",
					"markdown_inline",
					"python",
					"typescript",
					"html",
					"css",
					"yaml",
					"javascript",
					"go",
					"gomod",
					"gosum",
					"gitignore",
				},
				sync_install = false,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						node_decremental = "<bs>",
						scope_incremental = false,
					},
				},
				textobjects = {
					enable = true,
					move = {
						goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer" },
						goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer" },
					},
				},
			})
		end,
	},
}
