-- Nerd tree related stuff
return {
	"nvim-neo-tree/neo-tree.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
  cmd = { "Neotree" },
	opts = {
		event_handlers = {
			{
				event = "file_opened",
				handler = function(arg)
					-- auto close
					require("neo-tree").close_all()
				end,
			},
		},
	},
}
