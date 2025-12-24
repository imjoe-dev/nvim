local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.hidden = true
opt.swapfile = false
opt.backup = false
opt.writebackup = false
opt.undofile = true
opt.confirm = true
opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.updatetime = 250
opt.timeoutlen = 400
opt.completeopt = { "menu", "menuone", "noselect" }

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.termguicolors = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.wrap = false
opt.laststatus = 3
opt.showmode = false
opt.cmdheight = 1
opt.pumheight = 10

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.breakindent = true

opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

opt.splitbelow = true
opt.splitright = true

opt.autoread = true
opt.backspace = { "indent", "eol", "start" }
opt.path:append("**")
opt.wildmenu = true
opt.wildignorecase = true
opt.wildmode = { "longest", "list", "full" }

opt.lazyredraw = true
opt.synmaxcol = 240

opt.foldenable = false
opt.foldlevel = 99
opt.foldmethod = "manual"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
