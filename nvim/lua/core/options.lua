-- ------------------------
-- Put general options here
-- ------------------------

-- Default settings
-- ----------------

-- Default tabs is C Niluje's style
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = false

-- Show cursor line
vim.opt.cursorline = true

-- Show relative line number
vim.opt.number = true
vim.opt.relativenumber = true

-- Highlight searches
vim.opt.hlsearch = true
-- Searches are not case sensitive
vim.opt.incsearch = true
vim.opt.ic = true

-- Do not use swap file
vim.opt.swapfile = false

-- Disable bell
vim.opt.errorbells = false

-- Uses the system clipboard
vim.opt.clipboard:append{"unnamedplus"}

-- Standard use of Esc in terminal window
vim.cmd("tnoremap <Esc> <C-\\><C-n>")

