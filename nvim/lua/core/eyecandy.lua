-- ------------------------
-- Setup all shiny stuff
-- ------------------------

-- Colorscheme
local colorscheme = "onedarkpro"

local status_ok, colorscheme_plugin = pcall(require, colorscheme)
if not status_ok then
  return
end
colorscheme_plugin.setup({
	options = {
		cursorline = true,
	}
})
vim.cmd("colorscheme " .. colorscheme)

-- Status line
local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end
lualine.setup({
	options = {
		theme = "onedark",
		section_separators = "",
		component_separators = "",
	}
})

-- Treesitter
local status_ok, treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end
treesitter.setup({
	ensure_installed = { "c", "cpp", "lua", "python", "verilog",
						 "bash", "vim", "latex", "make", "cmake",
						 "yaml", "json", "dockerfile", "gitignore", "markdown", "org", },
	highlight = {
		enable = true,
	},
	rainbow = {
		enable = true,
	}
})

