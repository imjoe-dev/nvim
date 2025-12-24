return {
  "mason-org/mason-lspconfig.nvim",
  opts = {
    automatic_enable = true,
    ensure_installed = {
      "lua_ls",
      "ts_ls",
      "gopls",
    },
  },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
}
