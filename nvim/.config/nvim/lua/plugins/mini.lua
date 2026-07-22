return {
	"nvim-mini/mini.nvim",
	version = false,
	config = function()
		require("mini.cursorword").setup()
		local files = require("mini.files")
		files.setup({
			windows = {
				max_number = 3,
			},
		})
		-- require("mini.icons").setup()
		require("mini.jump").setup()
		-- require("mini.pairs").setup()
		require("mini.statusline").setup()
		-- require("mini.surround").setup()
		-- require("mini.tabline").setup()

		vim.keymap.set("n", "<leader>e", function()
			local _ = files.close() or files.open(vim.api.nvim_buf_get_name(0), false)
			vim.defer_fn(function()
				files.reveal_cwd()
			end, 30)
		end, { desc = "mini.files toggle" })
	end,
}
