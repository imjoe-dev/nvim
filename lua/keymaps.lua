local opts = { noremap = true, silent = true };

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local function map(mode, lhs, rhs, o)
  vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", opts, o or {}))
end

local function map_all(mode, list)
  for _, m in ipairs(list) do
    map(mode, m[1], m[2], m[3])
  end
end

local function quit()
  vim.cmd("quit")
end

map_all("n", {
  { "<leader>w", ":write<CR>", { desc = "write current buffer" } },
  { "<leader>h", ":nohlsearch<CR>", { desc = "clean highlight" } },
  { "<leader>q", quit, { desc = "quit neovim" } },
  
  { "<C-h>", "<C-w>h", { desc = "focus left split" } },
  { "<C-j>", "<C-w>j", { desc = "focus down split" } },
  { "<C-k>", "<C-w>k", { desc = "focus up split" } },
  { "<C-l>", "<C-w>l", { desc = "focus right split" } },

  { "<C-d>", "<C-d>zz", { desc = "scroll down" } },
  { "<C-u>", "<C-u>zz", { desc = "scroll up" } },

  { "n", "nzzzv", { desc = "next search" } },
  { "N", "Nzzzv", { desc = "prev search" } },

  { "<leader>Y", '"+Y', { desc = "copy line" } },
  { "<leader>p", '"+p', { desc = "paste clipboard" } },

  { "<leader>bd", ":bd", { desc = "close current buffer" }},
})

map_all("v", {
  { "J", ":m '>+1<CR>gv=gv", { desc = "move line down" } },
  { "K", ":m '<-2<CR>gv=gv", { desc = "move line up" } },
  { "<", "<gv", { desc = "indent left" } },
  { ">", ">gv", { desc = "indent right" } },

  { "p", '"_dP', { desc = "paste" } },
})

map_all({ "n", "v" }, {
  { "<leader>y", '"+y', { desc = "copy selection" } },
})
