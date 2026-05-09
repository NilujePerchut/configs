-- Eye candy stuff

vim.pack.add({
	"https://github.com/navarasu/onedark.nvim",
	"https://github.com/HiPhish/rainbow-delimiters.nvim",
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/nvim-mini/mini.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
	"https://github.com/goolord/alpha-nvim",
})

-- Use onedark theme
od = require("onedark")
od.setup {style = "dark"}
od.load()
vim.cmd.hi("Comment gui=none")

-- Lualine
require("lualine").setup {
  optons = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = '|',
    section_separators = '',
  },
}

-- Whitespace Highlight
require("mini.trailspace").setup()

-- Add indentation guides even on blank lines
require("ibl").setup()

-- Basic start page
require("alpha").setup(require("alpha.themes.startify").config)
