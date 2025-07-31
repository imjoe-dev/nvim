local keymap = vim.keymap

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	keymap.set(mode, lhs, rhs, options)
end

map("n", "<leader>e", function()
	local api = require("nvim-tree.api")
	if api.tree.is_visible() then
		api.tree.focus()
	else
		api.tree.open()
	end
end)
map("n", "<leader>f", ":Telescope find_files<CR>")
map("n", "<leader>g", ":Telescope live_grep<CR>")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<leader>t", ":bprev<CR>")
map("n", "<leader>y", ":bnext<CR>")
map("n", "<leader>q", ":Bdelete<CR>")

map("v", "<", "<gv")
map("v", ">", ">gv")

map("i", "jk", "<Esc>")

-- Telescope
map("n", "<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>fo", "<cmd>lua require('telescope.builtin').oldfiles()<CR>")

-- cmp
map("n", "<C-Space>", function()
	return require("cmp").complete()
end)
map("n", "<CR>", function()
	return require("cmp").confirm({ select = true })
end)

require("core.lsp_keymaps")

map("n", "<leader>f", function()
	require("conform").format({ lsp_fallback = true })
end)

-- bufferline
map("n", "<S-l>", ":BufferLineCycleNext<CR>")
map("n", "<S-h>", ":BufferLineCyclePrev<CR>")

return {}
