-- nvim-treesitter: el README recomienda `build = ':TSUpdate'` (lazy.nvim).
-- vim.pack no tiene campo `build`, asi que usamos PackChanged.
-- Debe registrarse ANTES de vim.pack.add para que corra en la instalacion.
vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name ~= "nvim-treesitter" then return end
    if kind == "install" or kind == "update" then
      if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
      vim.cmd("TSUpdate")
    end
  end,
})

vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
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

-- lsp
vim.lsp.enable({
  "lua_ls",
  "gopls",
})

vim.lsp.config("*", {
  capabilities = require("mini.completion").get_lsp_capabilities()
})

-- treesitter: parsers
require("nvim-treesitter").install({
  "go",
  "gosum",
  "gomod",
  "toml",
  "lua",
})

-- treesitter: activar highlighting y folds por filetype
-- (highlighting NO es automatico en la rama main de nvim-treesitter)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "go", "gomod", "gosum", "toml", "lua" },
  callback = function()
    vim.treesitter.start()

    -- folds (abiertos por defecto; usa `za` para plegar/desplegar)
    vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
    vim.wo[0][0].foldmethod = "expr"
    vim.wo[0][0].foldlevel = 99

    -- indent (experimental)
    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
  end,
})
