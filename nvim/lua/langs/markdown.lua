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
        name = "[L]ang",
        ["p"] = {"<cmd>MarkdownPreview<cr>", "[P]review"},
      },
    }, { prefix = "<space>" })
		end)
	end,
	}
)
