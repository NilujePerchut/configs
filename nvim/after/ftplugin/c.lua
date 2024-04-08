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
wk.register({
  ["l"] = {
    name = "[L]ang",
    ["t"] = {
      name = "[T]abs",

      ["k"] = { function()
        vim.bo.tabstop = 8
        vim.bo.softtabstop = 8
        vim.bo.shiftwidth = 8
        vim.bo.expandtab = false
      end, "[K]ernel"},

      ["d" ]= { function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = false
      end, "[D]efault"},

      ["n" ]= { function()
        vim.bo.tabstop = 4
        vim.bo.softtabstop = 4
        vim.bo.shiftwidth = 4
        vim.bo.expandtab = true
      end, "[N]x"}
    },
  },
}, { prefix = "<space>" })
