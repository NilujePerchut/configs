-- ------------------------
-- Lua stuff
-- ------------------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "lua",
	callback = function()
		vim.schedule(function()
      vim.bo.tabstop = 2
      vim.bo.softtabstop = 2
      vim.bo.shiftwidth = 2
      vim.bo.expandtab = true
      vim.wo.colorcolumn = "80"
		end)
	end,
	}
)

