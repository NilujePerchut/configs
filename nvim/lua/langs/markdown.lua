--
-- Markdown stuff
-- ----------------

vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		vim.schedule(function()
      -- Specifics key maps
      local wk = require("which-key")
      wk.register({
      ["l"] = {
        name = "Lang",
        ["p"] = {"<cmd>MarkdownPreview<cr>", "Preview"},
      },
    }, { prefix = "<space>" })
		end)
	end,
	}
)
