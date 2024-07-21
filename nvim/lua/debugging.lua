--
-- Debugging related stuff
-- ----------------

-- Open dapui interface automatically
local dap = require("dap")
local dapui = require("dapui")
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Mason should be setup first
--require("mason-nvim-dap").setup({
--    ensure_installed = { "python", "rust" }
--})

function AddDebugKeymaps()
  -- Add debug related keymaps
  -- Which key for breakpoints
  local wk = require("which-key")
  wk.add({
    { "<space>l", group = "[L]ang" },
    { "<space>ld", group = "[D]ebugging" },
    { "<space>ldb", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle [b]reakpoint" },
    { "<space>lc", "<cmd>DapContinue<cr>", desc = "[C]ontinue"},
    { "<space>lo", "<cmd>DapStepOver<cr>", desc = "Step[O]ver"},
    { "<space>li", "<cmd>DapStepInto<cr>", desc = "Step[I]nto"},
    { "<space>le", "<cmd>DapStepOut<cr>", desc = "St[e]pOut"},
  }, { prefix = "<space>" })

  -- Taken from Vscode
  vim.keymap.set('n', '<F5>', "<cmd>DapContinue<cr>")
  vim.keymap.set('n', '<F10>', "<cmd>DapStepOver<cr>")
  vim.keymap.set('n', '<F11>', "<cmd>DapStepInto<cr>")
  vim.keymap.set('n', '<F12', "<cmd>DapStepOut<cr>")
end
