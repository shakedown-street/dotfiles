-- TODO: Set up nvim trouble
-- TODO: Set up nvim-treesitter

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed = { "lua_ls", "stylua" },
      },
    },
  },
}
