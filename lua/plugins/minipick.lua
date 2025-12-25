return {
  'nvim-mini/mini.pick',
  version = false,
  config = function ()
    require("mini.pick").setup()

    vim.keymap.set("n", "<leader>ff", ":Pick files<CR>")
    vim.keymap.set("n", "<leader>fg", ":Pick grep_live<CR>")
  end
}
