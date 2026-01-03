return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	version = false,
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
	},
	config = function()
		require("nvim-treesitter").setup({
			install_dir = vim.fn.stdpath("data") .. "/site",
		})

		require("nvim-treesitter").install({
			-- go
			"go",
			"gomod",
			"gosum",
			"gowork",

			-- react/js
			"typescript",
			"tsx",
			"javascript",
			"jsdoc",

			-- json
			"json",
			"jsonc",

			"sql",
			"html",
			"css",
			"markdown",
			"markdown_inline",
			"lua",
			"luadoc",
			"query",
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"go",
				"gomod",
				"gosum",
				"gowork",
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"json",
				"jsonc",
				"sql",
				"html",
				"css",
				"markdown",
			},
			callback = function()
				vim.treesitter.start()
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"go",
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
				"json",
				"sql",
			},
			callback = function()
				vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
				vim.wo[0][0].foldmethod = "expr"
				vim.wo[0][0].foldlevel = 99
			end,
		})

		vim.api.nvim_create_autocmd("FileType", {
			pattern = {
				"go",
				"typescript",
				"typescriptreact",
				"javascript",
				"javascriptreact",
			},
			callback = function()
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})

		vim.treesitter.language.register("tsx", { "typescriptreact" })
		vim.treesitter.language.register("javascript", { "javascriptreact" })
	end,
}
