vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
})

local map = vim.keymap.set

-- nvim mini simple modules
require("mini.pairs").setup()
require("mini.comment").setup()
require("mini.surround").setup()
require("mini.bracketed").setup()
require("mini.notify").setup()
require("mini.indentscope").setup()
require("mini.tabline").setup()

-- mini files
local MiniFiles = require("mini.files")
map("n", "<leader>/", MiniFiles.open, { desc = "open mini files" })

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
