-- Debugger related stuff
return {
	{
    -- Theme inspired by Atom
		"navarasu/onedark.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000,
		option = 'dark',
		config = function()
			-- Load the colorscheme here
			vim.cmd.colorscheme("onedark")

			-- You can configure highlights by doing something like
			vim.cmd.hi("Comment gui=none")
		end,
	},

	-- rainbow delimiters
	"HiPhish/rainbow-delimiters.nvim",

	-- Lualine
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {'nvim-tree/nvim-web-devicons'},
		opts = {
			icons_enabled = true,
			theme = 'onedark',
			component_separators = '|',
			section_separators = '',
		},
	},

	-- Whitespace Highlight
	{
		"johnfrankmorgan/whitespace.nvim",
		opts = {},
	},

	-- Add indentation guides even on blank lines
	{
		'lukas-reineke/indent-blankline.nvim',
		main = 'ibl',
		opts = {},
	},

	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"cpp",
					"go",
					"lua",
					"python",
					"rust",
					"typescript",
					"vimdoc",
					"vim",
					"bash",
					"diff",
					"hjson",
					"make",
					"markdown",
					"verilog",
				},
				auto_install = true,
				highlight = { enable = true },
				ident = { enable = true },
			})
		end,
	},
}
