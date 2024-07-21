--
-- Keymapping (excluding treesitter ones)
-- ----------------

-- Uses which key to handle key
local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup()
whichkey.add({
	{ "<space><space>", "<cmd>Telescope find_files<cr>", desc = "Find files" },
	{ "<space>!",  "<cmd>:rightbelow split | terminal<cr>", desc = "Spawn terminal" },

	-- Buffer menu
	{ "<space>b", group = "[B]uffer" },
	{ "<space>bb", "<cmd>Telescope buffers<cr>", desc = "Buffer list" },
	{ "<space>bc", "<cmd>%y *<cr>", desc = "Copy whole buffer" },
	{ "<space>bd", "<cmd>bd<cr>", desc = "Destroy buffer" },
	{ "<space>bN", "<cmd>new<cr>", desc = "New empty buffer" },
	{ "<space>bV", "<cmd>vnew<cr>", desc="New vertical empty buffer" },

	-- File menu
	{ "<space>f", group = "[F]ile" },
	{ "<space>ft", "<cmd>Neotree toggle<cr>", desc = "Toogle Neotree" },

	-- VCS/Git menu
	{ "<space>g", group = "Vcs/[G]it" },
	{ "<space>gg",  "<cmd>Neogit<cr>", desc = "Neogit status" },
	{ "<space>gf", "<cmd>Flog<cr>", desc = "Flog branch" },

	-- Window menu
	{ "<space>w", group = "[W]indow" },
	{ "<space>w/", "<cmd>vsplit<cr>", desc = "Split vert." },
	{ "<space>w-", "<cmd>split<cr>", desc = "Split hori." },
	{ "<space>wh", "<cmd>wincmd h<cr>", desc = "Window left" },
	{ "<space>wj", "<cmd>wincmd j<cr>", desc = "Window down" },
	{ "<space>wk", "<cmd>wincmd k<cr>", desc = "Window up" },
	{ "<space>wl", "<cmd>wincmd l<cr>", desc = "Window right" },
	{ "<space>wr", "<cmd>wincmd r<cr>", desc = "Window rotate" },
	{ "<space>wT", "<cmd>wincmd T<cr>", desc = "Buffer to tab" },

	-- Org menu
	{ "<space>o", group = "[O]rg mode" },

	-- Search menu
	{ "<space>s", group = "[S]earch" },

	-- Toggle menu
	{ "<space>T", group = "[T]oggle" },
	{ "<space>Tg", "<cmd>Gitsigns toggle_signs<cr>", desc = "Toggle git signs" },
	{ "<space>Tn", "<cmd>set invnumber<cr>", desc = "Toggle line num" },
	{ "<space>Tr", "<cmd>set invrelativenumber<cr>", desc = "Toggle relative line Num" },
	{ "<space>Ts", "<cmd>set list!<cr>", desc = "Toggle hidden sybols" },
	{ "<space>Tw", "<cmd>ToggleWhitespace<cr>", desc = "Toggle whitespace" },
	{ "<space>Ti", "<cmd>set list!<cr>", desc = "Toggle invisible chars" },

	-- Utils menu
	{ "<space>u", group = "[U]tils" },
	{ "<space>um", "<cmd>Mason<cr>", desc = "Mason" },

	-- Text menu
	{ "<space>t", group = "[t]ext" },
	{ "<space>tU", "gUiw", desc = "To uppercase" },
	{ "<space>tu", "guiw", desc = "To lowercase" },
	{ "<space>tx", "<cmd>%!xxd<cr>", desc = "Text to Hex" },
	{ "<space>tX", "<cmd>%!xxd -r<cr>", desc = "Hex To Text" },
	-- Text/Folding submenu
	{ "<space>tf", group = "[F]olding" },
	{ "<space>tfi", "<cmd>set foldmethod=indent<cr>", desc = "Indent folding" },
	{ "<space>tfm", "<cmd>set foldmethod=marker<cr>", desc = "Marker folding" },
	{ "<space>tft", "zA", desc = "Toggle section" },
	{ "<space>tfa", "zM", desc = "Fold All" },
	{ "<space>tfu", "zR", desc = "Unfold All" },
	}, { prefix = "<space>" })

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

-- Standard use of Esc in terminal window
vim.cmd("tnoremap <Esc> <C-\\><C-n>")
