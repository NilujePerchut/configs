--
-- Niluje's neovim config
-- Shamelessly stolen from https://github.com/nvim-lua/kickstart.nvim
-- ----------------

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Core stuff
require("options")
require("plugins_base")
require("keys")
require("eye-candy")
require("debugging")
require("test")
