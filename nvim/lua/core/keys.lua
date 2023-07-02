--
-- Keymapping (excluding treesitter ones)
-- ----------------

-- Uses which key to handle key
local status_ok, whichkey = pcall(require, "which-key")
if not status_ok then
  return
end

whichkey.setup {}
whichkey.register({
	["<space>"] = { "<cmd>Telescope find_files<cr>", "Find files"},
	["!"] = { "<cmd>:rightbelow split | terminal<cr>", "Spawn terminal" },
	["b"] = {
		name = "Buffer",
		["b"] = { "<cmd>Telescope buffers<cr>", "Buffer list"},
		["c"] = { "<cmd>%y *<cr>", "Copy whole buffer"},
		["d"] = { "<cmd>bd<cr>", "Destroy buffer"},
		["N"] = { "<cmd>new<cr>", "New empty buffer"},
		["V"] = { "<cmd>vnew<cr>", "New vertical empty buffer"}
	},
	["f"] = {
		name = "File",
		["t"] = { "<cmd>Neotree toggle<cr>", "Toogle Neotree"}
	},
	["g"] = {
		name = "Vcs/git",
		["g"] = { "<cmd>Neogit<cr>", "Neogit status"}
	},
	["w"] = {
		name = "Window",
		["/"] = {"<cmd>vsplit<cr>", "Split vert."},
		["-"] = {"<cmd>split<cr>", "Split hori."},
		["h"] = {"<cmd>wincmd h<cr>", "Window left"},
		["j"] = {"<cmd>wincmd j<cr>", "Window down"},
		["k"] = {"<cmd>wincmd k<cr>", "Window up"},
		["l"] = {"<cmd>wincmd l<cr>", "Window right"},
		["r"] = {"<cmd>wincmd r<cr>", "Window rotate"},
		["T"] = {"<cmd>wincmd T<cr>", "Buffer to tab"}
	},
	["o"] = {
		name = "Org mode",
  },
	["s"] = {
		name = "Search",
  },
	["t"] = {
		name = "Toggle",
		["g"] = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle git signs"},
		["n"] = { "<cmd>set invnumber<cr>", "Toggle line num"},
		["r"] = { "<cmd>set invrelativenumber<cr>", "Toggle relative line Num"},
		["s"] = { "<cmd>set list!<cr>", "Toggle hidden sybols"},
		["w"] = { "<cmd>ToggleWhitespace<cr>", "Toggle whitespace"},
    ["i"] = { "<cmd>set list!<cr>", "Toggle invisible chars"}
	},
	["u"] = {
		name = "Utils",
		["m"] = { "<cmd>Mason<cr>", "Mason"},
	},
	["x"] = {
		name = "Text",
		["U"] = { "gUiw", "To uppercase"},
		["u"] = { "guiw", "To lowercase"},
    ["x"] = { "<cmd>%!xxd<cr>", "Text to Hex"},
    ["X"] = { "<cmd>%!xxd -r<cr>", "Hex To Text"},
    ["f"] = {
      name = "Folding",
      ["i"] = { "<cmd>set foldmethod=indent<cr>", "Indent folding"},
      ["m"] = { "<cmd>set foldmethod=marker<cr>", "Marker folding"},
      ["t"] = { "zA", "Toggle section"},
      ["a"] = { "zM", "Fold All"},
      ["u"] = { "zR", "Unfold All"},
    }
	},
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

