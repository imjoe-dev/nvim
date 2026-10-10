vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/romus204/tree-sitter-manager.nvim",
  "https://github.com/carldaws/miser.nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nyoom-engineering/oxocarbon.nvim",
})

local map = vim.keymap.set

vim.opt.background = "dark"
vim.cmd.colorscheme "oxocarbon"

-- nvim mini simple modules
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.bracketed").setup()
require("mini.indentscope").setup()
require("mini.tabline").setup()
require("mini.statusline").setup()
require("mini.jump2d").setup()
require("mini.diff").setup()
require("mini.completion").setup()

-- mini extra
local MiniExtra = require("mini.extra")
MiniExtra.setup()

local function show_document_symbols()
  MiniExtra.pickers.lsp({ scope = "document_symbol" })
end

local function show_document_diagnostics()
  MiniExtra.pickers.diagnostic({
    scope = "current",
  })
end

local function show_references()
  MiniExtra.pickers.lsp({ scope = "references" })
end

local function show_implementation()
  MiniExtra.pickers.lsp({ scope = "implementation" })
end

local function show_definition()
  MiniExtra.pickers.lsp({ scope = "type_definition" })
end

map("n", "<leader>ls", show_document_symbols, { desc = "show document symbols" })
map("n", "<leader>lR", show_references, { desc = "show document symbols" })
map("n", "<leader>li", show_implementation, { desc = "show document symbols" })
map("n", "<leader>lt", show_definition, { desc = "show document symbols" })
map("n", "<leader>ld", show_document_diagnostics, { desc = "show document diagnostics" })

-- mini notify
local MiniNotify = require("mini.notify")
MiniNotify.setup({
  lsp_progress = {
    level = "WARN"
  }
})

-- mini files
local MiniFiles = require("mini.files")
MiniFiles.setup()

map("n", "-", MiniFiles.open, { desc = "open mini files" })

-- mini pick
require("mini.pick").setup()
map("n", "<leader>ff", ":Pick files<CR>", { desc = "open file picker" })
map("n", "<leader>fg", ":Pick grep_live<CR>", { desc = "open grep live picker" })

-- mini git
require("mini.git").setup()
map("n", "<leader>gl", ":Git log --oneline --decorate --graph<CR>", { desc = "git log decorated" })
map("n", "<leader>ga", ":Git add %<CR>", { desc = "git add current file" })
map("n", "<leader>gA", ":Git add .<CR>", { desc = "git add all files" })
map("n", "<leader>gc", ":Git commit<CR>", { desc = "git commit" })
map("n", "<leader>gp", ":Git push<CR>", { desc = "git push" })
map("n", "<leader>gP", ":Git pull<CR>", { desc = "git pull" })

-- miser
require("miser").setup()

-- lsp
vim.lsp.enable({
  "lua_ls",
  "gopls",
})

vim.lsp.config("*", {
  capabilities = require("mini.completion").get_lsp_capabilities()
})

-- treesitter
require("tree-sitter-manager").setup({
  ensure_installed = {
    "go",
    "gosum",
    "gomod",
    "toml",
  }
})
