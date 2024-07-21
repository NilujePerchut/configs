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
  wk.add({
    { "<space>l", group = "[L]ang" },
    { "<space>lT", group = "[T]est" },
    { "<space>lTr",
      function()
        nt.run.run()
      end,
      desc = "Run nea[r]est" },
    { "<space>lTf",
      function()
        nt.run.run(vim.fn.expand("%"))
      end,
      desc = "Run whole [f]ile"},
    { "<space>lTd",
      function()
        nt.run.run({strategy = "dap"})
      end,
      desc = "Run nearest with [d]ap" },
  }, { prefix = "<space>" })
end
