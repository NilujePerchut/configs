-- Debugger related stuff
return {
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
	}
}
