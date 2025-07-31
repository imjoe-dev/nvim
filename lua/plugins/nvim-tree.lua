return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	config = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		local function on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			vim.keymap.set("n", "l", api.node.open.edit, opts("open file"))
			vim.keymap.set("n", "h", api.node.navigate.parent_close, opts("close folder"))
			vim.keymap.set("n", "v", api.node.open.vertical, opts("open vertical"))
			vim.keymap.set("n", "s", api.node.open.horizontal, opts("open horizontally"))

			vim.keymap.set("n", "a", api.fs.create, opts("create file"))
			vim.keymap.set("n", "r", api.fs.rename, opts("rename"))
			vim.keymap.set("n", "d", api.fs.remove, opts("delete file"))
			vim.keymap.set("n", "x", api.fs.cut, opts("cut file"))
			vim.keymap.set("n", "c", api.fs.copy.node, opts("copy file"))
			vim.keymap.set("n", "p", api.fs.paste, opts("paste file"))

			vim.keymap.set("n", "<C-r>", api.tree.reload, opts("reload tree"))
			vim.keymap.set("n", ".", api.tree.toggle_hidden_filter, opts("toggle dotfiles"))
			vim.keymap.set("n", "q", api.tree.close, opts("close tree"))
		end

		require("nvim-tree").setup({
			on_attach = on_attach,
			disable_netrw = true,
			hijack_netrw = true,
			update_focused_file = {
				enable = true,
				update_root = true,
			},
			view = {
				width = 30,
				side = "left",
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
			},
			renderer = {
				group_empty = true,
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
					},
					glyphs = {
						folder = {
							arrow_open = "",
							arrow_closed = "",
							default = "",
						},
					},
				},
			},
			filters = {
				dotfiles = false,
				git_ignored = true,
			},
			sync_root_with_cwd = true,
			hijack_cursor = true,
		})
	end,
}
