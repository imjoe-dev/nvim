vim.pack.add({
  "https://github.com/nvim-mini/mini.nvim",
})

local map = vim.keymap.set

local MiniFiles = require("mini.files")
map("n", "<leader>/", MiniFiles.open, { desc = "open mini files" })
