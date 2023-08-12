--
-- Test related configs
-- ----------------

require("neotest").setup({
  adapters = {
    require("neotest-python")
  }
})

function AddTestKeymaps()
  -- Add test related keymaps
  local nt = require("neotest")
  local wk = require("which-key")
  wk.register({
    ["l"] = {
      name = "Lang",
        ["T"] = {
          name = "Test",
          ["r"] = {function() nt.run.run() end, "Run nearest"},
          ["f"] = {function() nt.run.run(vim.fn.expand("%")) end, "Run whole file"},
          ["d"] = {function() nt.run.run({strategy = "dap"}) end, "Run nearest with dap"},
      },
    },
  }, { prefix = "<space>" })
end
