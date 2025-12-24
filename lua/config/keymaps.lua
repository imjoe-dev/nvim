local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "n", "nzzzv", opts)
map("n", "N", "Nzzzv", opts)

map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)

map("v", "p", '"_dP', opts)

map({ "n", "v" }, "<leader>y", '"+y', opts)
map("n", "<leader>Y", '"+Y', opts)
map("n", "<leader>p", '"+p', opts)

map("n", "<leader>bd", ":bd<CR>", opts)
map("n", "<leader>bn", ":bnext<CR>", opts)
map("n", "<leader>bp",  ":bprevious<CR>", opts)

map("n", "<leader>w", ":write<CR>", opts)
map("n", "<leader>q", ":quit<CR>", opts)
map("n", "<leader>h", ":nohlsearch<CR>", opts)

map("n", ";", ":", { noremap = true })
