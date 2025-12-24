return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = { "VeryLazy" },
  opts = {
    options = {
      offsets = {
        {
          filetype = "NvimTree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        }
      },
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end
}

