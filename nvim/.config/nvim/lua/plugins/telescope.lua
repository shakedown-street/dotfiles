return {
  "nvim-telescope/telescope.nvim",
  version = "*",
  dependencies = {
    "nvim-lua/plenary.nvim", -- optional but recommended
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
  },
  config = function()
    require("telescope").setup({
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          prompt_position = "top",
        },
        sorting_strategy = "ascending",
      },
    })

    local builtin = require("telescope.builtin")

    -- file pickers
    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
    vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Telescope git files" })
    vim.keymap.set("n", "<leader>f*", builtin.grep_string, { desc = "Telescope grep string" })
    vim.keymap.set("n", "<leader>f/", builtin.live_grep, { desc = "Telescope live grep" })

    -- vim pickers
    vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
    vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "Telescope oldfiles" })
    vim.keymap.set("n", "<leader>fc", builtin.commands, { desc = "Telescope commands" })
    vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
    vim.keymap.set("n", "<leader>fq", builtin.quickfix, { desc = "Telescope quickfix" })
    vim.keymap.set("n", "<leader>fj", builtin.jumplist, { desc = "Telescope jumplist" })
    vim.keymap.set("n", "<leader>f'", builtin.resume, { desc = "Telescope resume" })
    vim.keymap.set("n", "<leader>fp", builtin.pickers, { desc = "Telescope pickers" })

    -- lsp pickers
    vim.keymap.set("n", "<leader>fr", builtin.lsp_references, { desc = "Telescope lsp references" })
    vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope lsp document symbols" })
    vim.keymap.set("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Telescope lsp workspace symbols" })
    vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, { desc = "Telescope lsp definitions" })
    vim.keymap.set("n", "<leader>fD", builtin.diagnostics, { desc = "Telescope diagnostics" })
  end,
}
