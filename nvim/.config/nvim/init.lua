vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.scrolloff = 5
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.signcolumn = "yes:2"
vim.opt.guicursor = ""
vim.opt.clipboard = "unnamedplus"

-- NOTE: These settings get overridden by guess-indent
vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.tabstop = 2

require("config.lazy")

-- definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "definition" })

-- diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "diagnostic" })
vim.diagnostic.config({
	signs = {
		priority = 5,
	},
})

-- init treesitter
vim.api.nvim_create_autocmd("FileType", {
	pattern = {
		"bash",
		"css",
		"dockerfile",
		"go",
		"html",
		"htmldjango",
		"javascript",
		"javascriptreact",
		"json",
		"kdl",
		"lua",
		"markdown",
		"prisma",
		"python",
		"scss",
		"sh",
		"toml",
		"typescript",
		"typescriptreact",
		"yaml",
		"zsh",
	},
	callback = function()
		vim.treesitter.start()
	end,
})

-- do not deselect after indenting a visual block
vim.keymap.set("v", ">", ">gv", { desc = "indent right, keep selection" })
vim.keymap.set("v", "<", "<gv", { desc = "indent left, keep selection" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "move selection down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "move selection up" })

-- Toggle quickfix window
function ToggleQuickfix()
	for _, win in ipairs(vim.fn.getwininfo()) do
		if win.quickfix == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
end

vim.keymap.set("n", "<leader>q", ToggleQuickfix, { desc = "toggle quickfix" })

-- clear search highlight on escape key
vim.keymap.set("n", "<Esc>", function()
	if vim.v.hlsearch == 1 then
		vim.cmd("nohlsearch")
		return ""
	end
	return "<Esc>"
end, { expr = true })

-- close buffers
vim.keymap.set("n", "<leader>cc", function()
	vim.cmd("bd")
end, { desc = "close buffer" })

vim.keymap.set("n", "<leader>ca", "<cmd>%bd<cr>", { desc = "close all buffers" })
