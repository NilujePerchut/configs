vim.pack.add({
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-neo-tree/neo-tree.nvim",
	"https://github.com/stevearc/oil.nvim",
})

require("neo-tree").setup {
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				-- auto close
				require("neo-tree").close_all()
			end,

		}
	}
}

require("oil").setup()
