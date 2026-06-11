vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.scrolloff = 5
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- vscode probably overrides these, but oh well
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true

-- editor actions 
vim.keymap.set("n", "gd", "<Cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>")
vim.keymap.set({ "n", "v" }, "gra", "<Cmd>call VSCodeNotify('editor.action.quickFix')<CR>")
vim.keymap.set("n", "gri", "<Cmd>call VSCodeNotify('editor.action.goToImplementation')<CR>")
vim.keymap.set("n", "grt", "<Cmd>call VSCodeNotify('editor.action.goToTypeDefinition')<CR>")
vim.keymap.set("n", "grn", "<Cmd>call VSCodeNotify('editor.action.rename')<CR>")
vim.keymap.set("n", "K", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>")
vim.keymap.set("n", "<leader>d", "<Cmd>call VSCodeNotify('editor.action.showHover')<CR>")
vim.keymap.set("n", "grr", "<Cmd>call VSCodeNotify('references-view.findReferences')<CR>")

-- workbench actions
vim.keymap.set("n", "<leader>cc", "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
vim.keymap.set("n", "<leader>ca", "<Cmd>call VSCodeNotify('workbench.action.closeAllEditors')<CR>")
vim.keymap.set("n", "<leader>co", "<Cmd>call VSCodeNotify('workbench.action.closeOtherEditors')<CR>")
vim.keymap.set("n", "<leader>cl", "<Cmd>call VSCodeNotify('workbench.action.closeEditorsToTheRight')<CR>")
vim.keymap.set("n", "<leader>ff", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
vim.keymap.set("n", "<leader>f/", "<Cmd>call VSCodeNotify('workbench.action.findInFiles')<CR>")
vim.keymap.set("n", "<leader>fs", "<Cmd>call VSCodeNotify('workbench.action.gotoSymbol')<CR>")
vim.keymap.set("n", "<leader>fS", "<Cmd>call VSCodeNotify('workbench.action.showAllSymbols')<CR>")
vim.keymap.set("n", "<leader>fo", "<Cmd>call VSCodeNotify('workbench.action.openRecent')<CR>")
vim.keymap.set("n", "<leader>fb", "<Cmd>call VSCodeNotify('workbench.action.showAllEditors')<CR>")

-- jumps
vim.keymap.set("n", "]b", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>")
vim.keymap.set("n", "[b", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>")
vim.keymap.set("n", "]c", "<Cmd>call VSCodeNotify('workbench.action.editor.nextChange')<CR>")
vim.keymap.set("n", "[c", "<Cmd>call VSCodeNotify('workbench.action.editor.previousChange')<CR>")
vim.keymap.set("n", "]d", "<Cmd>call VSCodeNotify('editor.action.marker.next')<CR>")
vim.keymap.set("n", "[d", "<Cmd>call VSCodeNotify('editor.action.marker.prev')<CR>")

-- git
vim.keymap.set("n", "<leader>hr", "<Cmd>call VSCodeNotify('git.revertSelectedRanges')<CR>")
vim.keymap.set("n", "<leader>hp", "<Cmd>call VSCodeNotify('git.openChange')<CR>")
-- TODO: blame

-- clear search highlight on escape key
vim.keymap.set("n", "<Esc>", "<Cmd>nohlsearch<CR><Esc>")

-- do not deselect after indenting a visual block
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })
