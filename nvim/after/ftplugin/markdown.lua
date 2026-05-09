--
-- Markdown stuff
-- ----------------

vim.pack.add({
  "http://github.com/iamcco/markdown-preview.nvim",
})

-- Specifics key maps
local wk = require("which-key")
wk.add({
  { "<space>l", group = "[L]ang" },
  { "<space>lp", "<cmd>MarkdownPreview<cr>", desc = "[P]review" },
}, { prefix = "<space>" })
