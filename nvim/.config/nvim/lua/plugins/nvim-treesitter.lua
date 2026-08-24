return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"angular",
			"bash",
			"css",
			"dockerfile",
			"go",
			"html",
			"htmldjango",
			"javascript",
			"json",
			"kdl",
			"lua",
			"markdown",
			"markdown_inline",
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
