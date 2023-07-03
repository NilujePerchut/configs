--
-- Shell stuff
-- ----------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "sh",
	callback = function()
		vim.schedule(function()
			vim.bo.tabstop = 4
			vim.bo.softtabstop = 4
			vim.bo.shiftwidth = 4
			vim.bo.expandtab = false
      vim.wo.colorcolumn = "80"
		end)
	end,
	}
)
