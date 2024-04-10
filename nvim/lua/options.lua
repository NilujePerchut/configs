--
-- General options
-- ----------------

-- [[ Setting options ]]
-- See `:help vim.o`

-- Do not use swap file
vim.opt.swapfile = false

-- Disable bells
vim.opt.errorbells = false

-- Set highlight on search
vim.o.hlsearch = true
-- Set incremental search
vim.o.incsearch = true
-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true
-- Preview substitutions live, as you type!
vim.opt.inccommand = "nosplit"

-- Make line numbers default (and relative)
vim.wo.number = true
vim.wo.relativenumber = true

-- Don't show the mode, since it's already in status line
vim.opt.showmode = false

-- Set cursor line
vim.o.cursorline = true

-- Enable mouse mode
vim.o.mouse = "a"

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Decrease update time
vim.o.updatetime = 250
vim.opt.timeoutlen = 300
vim.wo.signcolumn = "yes"

-- Set completeopt to have a better completion experience
vim.o.completeopt = "menuone,noselect"

-- Uses the system clipboard
vim.opt.clipboard:prepend({ "unnamedplus" })

-- Set folding on indent by default
vim.o.foldmethod = "indent"
vim.o.foldenable = false
