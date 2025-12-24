local nvim_tree_focus_or_toggle = function()
  local tree = require("nvim-tree.api").tree

  local current = vim.api.nvim_get_current_buf()
  local current_buf_ft = vim.api.nvim_get_option_value("filetype", { buf = current })

  if current_buf_ft == "NvimTree" then
    tree.toggle()
  else
    tree.focus()
  end
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {}

    vim.api.nvim_create_autocmd({ "BufEnter", "QuitPre" }, {
      nested = false,
      callback = function(e)
        local tree = require("nvim-tree.api").tree

        if not tree.is_visible() then
          return
        end

        local win_count = 0
        for _,win_id in ipairs(vim.api.nvim_list_wins()) do
          if vim.api.nvim_win_get_config(win_id).focusable then
            win_count = win_count + 1
          end
        end

        if e.event == "QuitPre" and win_count == 2 then
          vim.api.nvim_cmd({ cmd = "qall" }, {})
        end

        if e.event == "BufEnter" and win_count == 1 then
          vim.defer_fn(function()
            tree.toggle({ find_file = true, focus = true })
            tree.toggle({ find_file = true, focus = false })
          end, 10)
        end
      end
    })

    vim.keymap.set("n", "<A-1>", nvim_tree_focus_or_toggle)
  end,
}
