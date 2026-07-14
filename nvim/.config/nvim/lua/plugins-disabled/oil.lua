return {
	"stevearc/oil.nvim",
	opts = {
		delete_to_trash = true,
		view_options = {
			show_hidden = true,
			is_always_hidden = function(name)
				return name == ".git"
			end,
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	lazy = false,
	keys = {
		{ "-", "<cmd>Oil<CR>", desc = "oil" },
	},
}
