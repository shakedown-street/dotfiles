return {
	"stevearc/aerial.nvim",
	opts = {},
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("aerial").setup({
			close_on_select = true,
		})
		vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<CR>", { desc = "aerial" })
	end,
}
