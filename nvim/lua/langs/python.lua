--
-- Python stuff
-- ----------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.schedule(function()
			vim.bo.tabstop = 4
			vim.bo.softtabstop = 4
			vim.bo.shiftwidth = 4
			vim.bo.expandtab = true
      vim.wo.colorcolumn = "80"

      -- DAP
      require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
      AddDebugKeymaps()

      -- Test
      AddTestKeymaps()

      -- TODO: Add Flake8 stuff here
		end)
	end,
	}
)
