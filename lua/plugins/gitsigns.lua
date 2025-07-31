return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	opts = {
		signs = {
			add = { text = "\u{2502}" },
			change = { text = "\u{2502}" },
			delete = { text = "\u{005f}" },
			topdelete = { text = "\u{203E}" },
			changedelete = { text = "\u{007E}" },
			untracked = { text = "\u{2506}" },
		},
		current_line_blame = true,
		current_line_blame_opts = { delay = 500, virt_text_pos = "eol" },
		on_attach = function(bufnr)
			local gs = package.loaded.gitsigns
			local function map(mode, l, r, desc)
				vim.keymap.set(mode, l, r, { buffer = bufnr, desc = "Git: " .. desc, noremap = true, silent = true })
			end

			local function next_hunk()
				if vim.wo.diff then
					vim.cmd("normal ]c")
				else
					gs.next_hunk()
				end
			end

			local function prev_hunk()
				if vim.wo.diff then
					vim.cmd("normal [c")
				else
					gs.prev_hunk()
				end
			end

			local function blame()
				gs.blame_line({ full = true })
			end

			map("n", "]c", next_hunk, "Next hunk")
			map("n", "[c", prev_hunk, "Prev hunk")
			map("n", "<leader>ghs", gs.stage_hunk, "Stage hunk")
			map("n", "<leader>ghr", gs.reset_hunk, "Reset hunk")
			map("n", "<leader>ghp", gs.preview_hunk, "Preview hunk")
			map("n", "<leader>ghb", blame, "Blame line")
			map({ "o", "x" }, "ih", gs.select_hunk, "Select hunk")
		end,
	},
}
