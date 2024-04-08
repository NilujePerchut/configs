--
-- Markdown stuff
-- ----------------

-- Specifics key maps
local wk = require("which-key")
wk.register({
  ["l"] = {
    name = "[L]ang",
    ["p"] = {"<cmd>MarkdownPreview<cr>", "[P]review"},
  },
}, { prefix = "<space>" })
