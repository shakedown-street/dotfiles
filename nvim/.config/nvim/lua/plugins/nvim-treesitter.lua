return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local parsers = {
      "bash",
      "css",
      "dockerfile",
      "go",
      "html",
      "javascript",
      "json",
      "kdl",
      "lua",
      "markdown",
      "prisma",
      "python",
      "scss",
      "toml",
      "tsx",
      "typescript",
      "yaml",
      "zsh",
    }
    require("nvim-treesitter").install(parsers)
  end,
}
