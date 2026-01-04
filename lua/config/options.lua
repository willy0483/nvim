-- OPTIONS
local set = vim.opt

--line nums
--set.relativenumber = true
set.number = true

-- indentation and tabs
set.tabstop = 4
set.shiftwidth = 4
set.autoindent = true
set.expandtab = true
set.smartindent = false

-- search settings
set.ignorecase = true
set.smartcase = true

-- cursor line
set.cursorline = true

-- clipboard
set.clipboard:append("unnamedplus")

-- keep cursor at least 8 rows from top/bot
set.scrolloff = 8

-- undo dir settings
set.swapfile = false
set.backup = false
set.undodir = "C:/Users/willy/AppData/Local/nvim-data/undo"
set.undofile = true

vim.g.undotree_DiffCommand = "FC"

-- Remove tilde symble
set.fillchars = { eob = " " }

vim.diagnostic.config({
	update_in_insert = false,
	underline = true,
})
