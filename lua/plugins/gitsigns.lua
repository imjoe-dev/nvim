return {
  "lewis6991/gitsigns.nvim",
  lazy = false,
  opts = {
    on_attach = function (buffer)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, desc)
        vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc, silent = true })
      end

      map("n", "]c", function ()
        if wim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          gitsigns.nav_hunk("next")
        end
      end, "Next hunk")

      map("n", "[c", function ()
        if wim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          gitsigns.nav_hunk("prev")
        end
      end, "prev hunk")

      map("n", "<leader>hs", gitsigns.stage_hunk)
    end
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end
}
