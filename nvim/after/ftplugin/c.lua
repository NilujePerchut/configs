--
-- C stuff
-- ----------------

-- Nx style by default
vim.bo.tabstop = 4
vim.bo.softtabstop = 4
vim.bo.shiftwidth = 4
vim.bo.expandtab = true
vim.wo.colorcolumn = "80"

-- Specifics key maps
local wk = require("which-key")
wk.add({
  { "<space>l", group = "[L]ang" },
  { "<space>lt", group = "[T]abs" },
  { "<space>ltk",
    function()
        vim.bo.tabstop = 8
        vim.bo.softtabstop = 8
        vim.bo.shiftwidth = 8
        vim.bo.expandtab = false
    end, desc = "[K]ernel" },

  { "<space>ltd",
    function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = false
    end, desc = "[D]efault" },

  { "<space>ltn",
    function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
    end, desc = "[N]x" },
}, { prefix = "<space>" })
