--
-- Niluje's neovim config
-- Shamelessly stolen from https://github.com/nvim-lua/kickstart.nvim
-- ----------------

-- Core stuff
bootstrap = require('core.plugins')
if bootstrap == true then
  return
end
require('core.options')
require('core.keys')
require('core.eye-candy')
require('core.lsp')
require('core.tools')
-- Language specifics
require('langs.c')
require('langs.lua')
require('langs.python')

