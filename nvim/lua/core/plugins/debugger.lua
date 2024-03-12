-- Debugger related stuff
return {
	"mfussenegger/nvim-dap",
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" }
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap" }
	},
	{"jay-babu/mason-nvim-dap.nvim",
	 opts = {
	    ensure_installed = { "python", "rust" }
	 }
	}
}
