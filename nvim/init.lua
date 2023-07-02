--
-- Niluje's neovim config
-- Shamelessly stolen from https://github.com/nvim-lua/kickstart.nvim
-- ----------------

-- Core stuff
require('core.plugins')
require('core.options')
require('core.keys')
require('core.eye-candy')
require('core.lsp')
require('core.tools')
-- Language specifics
require('langs.c')
require('langs.lua')
require('langs.python')
require('langs.cpp')
require('langs.vhdl')

