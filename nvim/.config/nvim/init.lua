vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.signcolumn = "yes:2"
vim.opt.termguicolors = true

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = -1
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.breakindent = true

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8

vim.opt.completeopt = { "menu", "menuone", "noselect", "popup" }
vim.opt.pumheight = 10

require("config.lazy")

-- treesitter start
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

-- definition
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)

		if client and client:supports_method("textDocument/definition") then
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {
				buffer = args.buf,
				desc = "vim.lsp.buf.definition()",
				silent = true,
			})
		end
	end,
})

-- diagnostics
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "diagnostic" })
vim.diagnostic.config({
	signs = {
		priority = 5,
	},
})

-- do not deselect after indenting a visual block
vim.keymap.set("v", "<", "<gv", { desc = "indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "indent right" })

-- move current selection up and down
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
vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "delete buffer" })
vim.keymap.set("n", "<leader>ba", "<cmd>%bdelete<CR>", { desc = "delete all buffers" })
vim.keymap.set("n", "<leader>bl", "<cmd>buffers<CR>", { desc = "list buffers" })

-- Copy filename
vim.keymap.set("n", "<leader>yf", function()
	local filename = vim.fn.expand("%:t")
	vim.fn.setreg("+", filename)
end, { desc = "yank filename" })

-- Copy relative path
vim.keymap.set("n", "<leader>yr", function()
	local filepath = vim.fn.expand("%")
	vim.fn.setreg("+", filepath)
end, { desc = "yank relative path" })

-- Copy absolute path
vim.keymap.set("n", "<leader>ya", function()
	local fullpath = vim.fn.expand("%:p")
	vim.fn.setreg("+", fullpath)
end, { desc = "yank absolute path" })

-- Grail note
local grail = vim.fn.expand("~/grail/notes.md")

vim.keymap.set("n", "<leader>n", function()
	vim.cmd("edit " .. vim.fn.fnameescape(grail))
	vim.cmd("keepjumps normal! G")
	-- vim.api.nvim_put({ "## " .. os.date("%Y-%m-%d %H:%M"), "" }, "l", true, true)
end, { desc = "note" })
