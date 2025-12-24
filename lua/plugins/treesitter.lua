return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  version = false,
  event = { "BufReadPost", "BufNewFile" },
  build = ":TSUpdate",
  dependencies = {
    { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
  },
  opts = {
    indent = { enable = true },
    highlight = { enable = true },
    auto_install = true,
    ensure_installed = {
      "c",
      "html",
      "javascript",
      "json",
      "jsonc",
      "lua",
      "markdown",
      "toml",
      "tsx",
      "typescript",
      "yaml",
      "go",
      "gomod",
      "gosum",
    },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ap"] = "@parameter.outer",
          ["ip"] = "@parameter.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
        },
        include_surrounding_whitespace = true,
      },
      move = {
        enable = true,
        set_jumps = true,
        keys = {
          ["]f"] = "@function.outer",
          ["[f"] = "@function.outer",
        },
      },
    },
  },
}
