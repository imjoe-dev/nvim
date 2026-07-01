return {
	"mason-org/mason-lspconfig.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		automatic_enable = true,
		ensure_installed = {
			"lua_ls",
			"tsgo",
			"gopls",
			"clangd",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
