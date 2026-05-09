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
require("eye_candy")
require("files")
require("git")
require("lsp")
require("autocomplete")

-- Must be the last one
require("keys")
