return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	version = false,
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		{ "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
	},
	config = function()
		local ts = require("nvim-treesitter")

		ts.install({ "lua", "go", "gomod", "gosum" })

		vim.api.nvim_create_autocmd("FileType", {
			group = vim.api.nvim_create_augroup("ui.treesitter", { clear = true }),
			pattern = { "*" },
			callback = function(e)
				local lang = e.match

				local ok, _ = pcall(ts.install, { lang }, { summary = true })
				if not ok then
					return
				end

				ok, _ = pcall(vim.treesitter.start, e.buf, lang)
				if not ok then
					return
				end

				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
			end,
		})
	end,
}
