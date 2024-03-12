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
require("core.options")
require("core.plugins_base")
require("core.keys")
require("core.eye-candy")
require("core.debug")
require("core.test")
---- Language specifics
require("langs.c")
require("langs.lua")
require("langs.python")
require("langs.cpp")
require("langs.vhdl")
require("langs.sh")
require("langs.markdown")
require("langs.rust")
