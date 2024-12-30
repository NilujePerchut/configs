--
-- Plugins management
-- ----------------

-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- These are only the core plugins
-- non core plugins will be loaded afterward
require("lazy").setup({
  { "ibhagwan/smartyank.nvim", opts = {} },

  -- "gc" to comment visual regions/lines
  { "numToStr/Comment.nvim", opts = {} },

  { -- Useful plugin to show you pending keybinds.
    "folke/which-key.nvim",
    event = "VimEnter", -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require("which-key").setup()

      -- Document existing key chains
      require("which-key").add({
        { "<leader>s", group = "[S]earch" },
        { "<leader>s_", hidden = true },
      })
    end,
  },

  -- imports all module in plugins directory
  { import = "plugins" },
})
