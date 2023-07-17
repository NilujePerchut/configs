--
-- Helper tools
-- ----------------

-- Enable Comment.nvim
require('Comment').setup()

local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end
vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])
neotree.setup({
	event_handlers = {
		{
			event = "file_opened",
			handler = function(file_path)
				-- auto close
				require("neo-tree").close_all()
			end
		},
	}
})

-- Gitsigns
-- See `:help gitsigns.txt`
require('gitsigns').setup()

-- [[ Configure Telescope ]]
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
}

-- Neogit
require("neogit").setup()

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>s?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
vim.keymap.set('n', '<leader>s/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = 'Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = 'Search Help' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = 'Search Diagnostics' })

-- Setup neovim lua configuration
require('neodev').setup()

-- Neovim orgmode
local status_ok, org = pcall(require, "orgmode")
if not status_ok then
  return
end
org.setup({})
org.setup_ts_grammar()

-- Org-bullet
local status_ok, org_bullets = pcall(require, "org-bullets")
if not status_ok then
  return
end
org_bullets.setup()

