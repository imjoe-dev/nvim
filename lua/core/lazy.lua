local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.loop and vim.loop.fs_stat(lazypath)) then
	local out = vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({ { "Error clonando lazy.nvim:\n", "ErrorMsg" }, { "\n" .. out } }, true, {})
		return
	end
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
	spec = { { import = "plugins" } },
	install = { colorscheme = { "tokyonight", "catppuccin" } },
	checker = { enabled = true, notify = false },
	defaults = {
		lazy = true,
	},
	change_detection = {
		notify = false,
	},
})
