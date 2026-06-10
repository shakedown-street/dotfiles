vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.scrolloff = 5
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- goto references
vim.keymap.set("n", "grd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>")
vim.keymap.set("n", "grr", "<Cmd>call VSCodeNotify('references-view.findReferences')<CR>")
vim.keymap.set("n", "grR", "<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>")
vim.keymap.set("n", "grn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
vim.keymap.set({ "n", "v" }, "gra", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>")

-- show diagnostic hover
vim.keymap.set("n", "<leader>d", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>")

-- vscode probably overrides these, but oh well
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

-- clear search highlight on escape key
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>")

-- do not deselect after indenting a visual block
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

-- emulate ]b and [b
vim.keymap.set("n", "]b", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
vim.keymap.set("n", "[b", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")