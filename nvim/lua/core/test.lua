--
-- Test related configs
-- ----------------

require("neotest").setup({
  adapters = {
    require("neotest-python"),
    require("neotest-rust")
  }
})

function AddTestKeymaps()
  -- Add test related keymaps
  local nt = require("neotest")
  local wk = require("which-key")
  wk.register({
    ["l"] = {
      name = "[L]ang",
        ["T"] = {
          name = "[T]est",
          ["r"] = {function() nt.run.run() end, "Run nea[r]est"},
          ["f"] = {function() nt.run.run(vim.fn.expand("%")) end, "Run whole [f]ile"},
          ["d"] = {function() nt.run.run({strategy = "dap"}) end, "Run nearest with [d]ap"},
      },
    },
  }, { prefix = "<space>" })
end
