-- Debugger related stuff
return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"mfussenegger/nvim-dap-python",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
	},
	{"jay-babu/mason-nvim-dap.nvim",
	 opts = {
	    ensure_installed = { "python", "rust" }
	 }
	}
}
