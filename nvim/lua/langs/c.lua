--
-- C stuff
-- ----------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "c",
	callback = function()
		vim.schedule(function()
			vim.bo.tabstop = 4
			vim.bo.softtabstop = 4
			vim.bo.shiftwidth = 4
			vim.bo.expandtab = false
      vim.wo.colorcolumn = "80"
      -- Specifics key maps
      local wk = require("which-key")
      wk.register({
      ["l"] = {
        name = "Lang",
        ["t"] = {
          name = "Tabs",
          ["k"] = { function()
                      vim.bo.tabstop = 8
                      vim.bo.softtabstop = 8
                      vim.bo.shiftwidth = 8
                      vim.bo.expandtab = false
                    end, "Kernel"},
          ["d" ]= { function()
                      vim.bo.tabstop = 4
                      vim.bo.softtabstop = 4
                      vim.bo.shiftwidth = 4
                      vim.bo.expandtab = false
                    end, "Default"},
          ["n" ]= { function()
                      vim.bo.tabstop = 4
                      vim.bo.softtabstop = 4
                      vim.bo.shiftwidth = 4
                      vim.bo.expandtab = true
                    end, "Nx"}
        },
      },
    }, { prefix = "<space>" })
		end)
	end,
	}
)

