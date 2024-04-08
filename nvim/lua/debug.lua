--
-- Debugging related stuff
-- ----------------

-- Open dapui interface automatically
local dap, dapui = require("dap"), require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

---- Mason should be setup first
--require("mason-nvim-dap").setup({
--    ensure_installed = { "python", "rust" }
--})

function AddDebugKeymaps()
  -- Add debug related keymaps
  -- Which key for breakpoints
  local wk = require("which-key")
  wk.register({
    ["l"] = {
      name = "[L]ang",
      ["d"] = {
        name = "[D]ebugging",
        ["b"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle [b]reakpoint"},
        ["c"] = { "<cmd>DapContinue<cr>", "[C]ontinue"},
        ["o"] = { "<cmd>DapStepOver<cr>", "Step[O]ver"},
        ["i"] = { "<cmd>DapStepInto<cr>", "Step[I]nto"},
        ["e"] = { "<cmd>DapStepOut<cr>", "St[e]pOut"},
      },
    },
  }, { prefix = "<space>" })

  -- Taken from Vscode
  vim.keymap.set('n', '<F5>', "<cmd>DapContinue<cr>")
  vim.keymap.set('n', '<F10>', "<cmd>DapStepOver<cr>")
  vim.keymap.set('n', '<F11>', "<cmd>DapStepInto<cr>")
  vim.keymap.set('n', '<F12', "<cmd>DapStepOut<cr>")
end
