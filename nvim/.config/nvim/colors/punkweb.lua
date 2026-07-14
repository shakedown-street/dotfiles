vim.cmd("highlight clear")
vim.o.termguicolors = true

local palettes = {
	nord = {
		background = "#2e3440",
		surface = "#3b4252",
		border = "#434c5e",
		overlay = "#4c566a",
		muted = "#d8dee9",
		subtle = "#e5e9f0",
		foreground = "#eceff4",
		info = "#8fbcbb",
		accent = "#88c0d0",
		primary = "#81a1c1",
		highlight = "#5e81ac",
		error = "#bf616a",
		warning = "#ebcb8b",
		success = "#a3be8c",
	},
	catppuccin = {
		background = "#24273a",
		surface = "#1e2030",
		border = "#363a4f",
		overlay = "#494d64",
		muted = "#cad3f5",
		subtle = "#b8c0e0",
		foreground = "#cad3f5",
		info = "#91d7e3",
		accent = "#8aadf4",
		primary = "#c6a0f6",
		highlight = "#5b6078",
		error = "#ed8796",
		warning = "#eed49f",
		success = "#a6da95",
	},
}

local c = palettes["nord"]

local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

--[[ 
-- Base
hl("Normal", { fg = c.fg, bg = c.bg })

-- Syntax

hl("Boolean", { fg = c.primary })
hl("Character", { fg = c.success })
hl("Conditional", { fg = c.primary })
hl("Constant", { fg = c.fg })
hl("Comment", { fg = c.muted, italic = true })
hl("Debug", { fg = c.fg })
hl("Define", { fg = c.primary })
hl("Delimiter", { fg = c.fg })
hl("Error", { fg = c.error })
hl("Exception", { fg = c.primary })
hl("Float", { fg = c.error })
hl("Function", { fg = c.accent })
hl("Identifier", { fg = c.fg })
hl("Include", { fg = c.primary })
hl("Keyword", { fg = c.primary })
hl("Label", { fg = c.primary })
hl("Number", { fg = c.error })
hl("Operator", { fg = c.primary })
hl("PreProc", { fg = c.primary })
hl("Repeat", { fg = c.primary })
hl("Special", { fg = c.fg })
hl("SpecialChar", { fg = c.warning })
hl("Statement", { fg = c.primary })
hl("StorageClass", { fg = c.primary })
hl("String", { fg = c.success })
hl("Structure", { fg = c.primary })
hl("Tag", { fg = c.fg })
hl("Todo", { fg = c.warning })
hl("Type", { fg = c.primary })
hl("Typedef", { fg = c.primary })

-- Treesitter (modern highlighting)
hl("@attribute", { fg = c.fg })
hl("@comment", { fg = c.muted, italic = true })
hl("@boolean", { fg = c.primary })
hl("@function", { fg = c.accent })
hl("@keyword", { fg = c.primary })
hl("@property", { fg = c.fg })
hl("@number", { fg = c.error })
hl("@string", { fg = c.success })
hl("@tag", { fg = c.primary })
hl("@tag.attribute", { fg = c.accent })
hl("@tag.delimiter", { fg = c.primary })
hl("@type", { fg = c.accent })
hl("@variable", { fg = c.fg })
]]

-- Base ------------------------------------------------------------------------

hl("Normal", { fg = c.foreground, bg = c.background })
hl("NormalFloat", { fg = c.foreground, bg = c.surface })
hl("FloatBorder", { fg = c.border, bg = c.surface })

hl("CursorLine", { bg = c.surface })
hl("CursorLineNr", { fg = c.highlight, bold = true })

hl("LineNr", { fg = c.overlay })
hl("SignColumn", { bg = c.background })

hl("Visual", { bg = c.overlay })
hl("Search", { fg = c.background, bg = c.warning })
hl("IncSearch", { fg = c.background, bg = c.accent })

hl("StatusLine", { fg = c.foreground, bg = c.surface })
hl("StatusLineNC", { fg = c.muted, bg = c.surface })

hl("VertSplit", { fg = c.border })

hl("Pmenu", { fg = c.foreground, bg = c.surface })
hl("PmenuSel", { fg = c.background, bg = c.accent })

hl("Todo", { fg = c.warning, bold = true })
hl("Error", { fg = c.error, bold = true })
hl("WarningMsg", { fg = c.warning })
hl("DiagnosticError", { fg = c.error })
hl("DiagnosticWarn", { fg = c.warning })
hl("DiagnosticInfo", { fg = c.info })
hl("DiagnosticHint", { fg = c.accent })

-- Syntax ---------------------------------------------------------------------

-- Core language structure
hl("Comment", { fg = c.overlay, italic = true })

hl("Constant", { fg = c.muted }) -- literals base
hl("String", { fg = c.success }) -- "safe" green for readability
hl("Character", { fg = c.success })

hl("Number", { fg = c.error })
hl("Float", { fg = c.error })
hl("Boolean", { fg = c.primary })
hl("Special", { fg = c.info })

-- Identifiers
hl("Identifier", { fg = c.foreground })
hl("Function", { fg = c.accent, bold = true })
hl("Variable", { fg = c.foreground })

-- Language keywords
hl("Keyword", { fg = c.primary, bold = true })
hl("Statement", { fg = c.primary })
hl("Conditional", { fg = c.primary })
hl("Repeat", { fg = c.primary })
hl("Label", { fg = c.info })

-- Types / structure
hl("Type", { fg = c.highlight })
hl("StorageClass", { fg = c.primary })
hl("Structure", { fg = c.highlight })
hl("Typedef", { fg = c.highlight })

-- Preprocessor / meta
hl("PreProc", { fg = c.info })
hl("Include", { fg = c.info })
hl("Define", { fg = c.info })

-- Punctuation / operators
hl("Operator", { fg = c.muted })
hl("Delimiter", { fg = c.muted })
hl("Tag", { fg = c.primary })

-- Special cases
hl("SpecialChar", { fg = c.warning })
hl("Debug", { fg = c.error })

-- Treesitter ---------------------------------------------------------------

hl("@variable", { fg = c.foreground })
hl("@variable.builtin", { fg = c.primary })

hl("@function", { fg = c.accent, bold = true })
hl("@function.call", { fg = c.accent })
hl("@method", { fg = c.accent })
hl("@constructor", { fg = c.highlight })

hl("@keyword", { fg = c.primary, bold = true })
hl("@keyword.function", { fg = c.primary })
hl("@keyword.return", { fg = c.warning })

hl("@string", { fg = c.success })
hl("@string.escape", { fg = c.warning })

hl("@number", { fg = c.error })
hl("@boolean", { fg = c.primary })

hl("@type", { fg = c.highlight })
hl("@type.builtin", { fg = c.info })

hl("@property", { fg = c.info })
hl("@field", { fg = c.foreground })

hl("@constant", { fg = c.muted })
hl("@constant.builtin", { fg = c.primary })

hl("@parameter", { fg = c.foreground })

hl("@operator", { fg = c.muted })

hl("@comment", { fg = c.overlay, italic = true })

hl("@punctuation.delimiter", { fg = c.muted })
hl("@punctuation.bracket", { fg = c.muted })
hl("@punctuation.special", { fg = c.warning })

hl("@tag", { fg = c.primary })
hl("@tag.attribute", { fg = c.accent })
hl("@tag.delimiter", { fg = c.muted })
