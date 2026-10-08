require("vim._core.ui2").enable({})

-- autocmds
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
  group = augroup("highlight_yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank({ timeout = 150 })
  end,
})

autocmd({ "FocusGained", "BufEnter" }, {
  group = augroup("checktime", { clear = true }),
  command = "checktime",
})

-- local modules
require("options")
require("keymaps")
require("pack")
