return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {
				ensure_installed = {
					"angularls",
					"bashls",
					"cssls",
					"djlsp",
					"docker_language_server",
					"eslint",
					"gopls",
					"html",
					"lua_ls",
					"prismals",
					"pyright",
					"stylua",
					"tailwindcss",
					"tsgo",
				},
			},
		},
	},
	config = function()
		vim.lsp.config("lua_ls", {
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
					workspace = {
						library = vim.api.nvim_get_runtime_file("", true),
					},
				},
			},
		})
		vim.lsp.config("pyright", {
			settings = { python = {
				analysis = {
					typeCheckingMode = "off",
				},
			} },
		})
		local eslint_on_attach = vim.lsp.config.eslint.on_attach
		vim.lsp.config("eslint", {
			on_attach = function(client, bufnr)
				if eslint_on_attach then
					eslint_on_attach(client, bufnr)
				end
				vim.api.nvim_create_autocmd("BufWritePre", {
					buffer = bufnr,
					command = "LspEslintFixAll",
				})
			end,
		})
	end,
}
