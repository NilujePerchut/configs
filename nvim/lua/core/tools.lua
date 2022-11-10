-- ------------------------
-- All useful tools
-- ------------------------

-- NeoTree
-- Remove deprecated commands
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

-- Neogit
local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
  return
end
neogit.setup({})

-- Gitsigns
local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end
gitsigns.setup({})

-- Neovim orgmode
local status_ok, org = pcall(require, "orgmode")
if not status_ok then
  return
end
org.setup({})

-- Org-bullet
local status_ok, org_bullets = pcall(require, "org-bullets")
if not status_ok then
  return
end
org_bullets.setup()

