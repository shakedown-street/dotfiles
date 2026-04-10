return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = {
          "bashls",
          "cssls",
          "docker_language_server",
          "eslint",
          "html",
          "lua_ls",
          "prismals",
          "remark_ls",
          "stylua",
          "tailwindcss",
          "ts_ls",
        },
      },
    },
  },
}
