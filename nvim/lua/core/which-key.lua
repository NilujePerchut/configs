-- ------------------------
-- Which-key setup
-- ------------------------

-- Default which key setup
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
		["l"] = {"<cmd>wincmd l<cr>", "Window right"}
	},
	["t"] = {
		name = "Toggle",
		["g"] = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle git signs"},
		["n"] = { "<cmd>set invnumber<cr>", "Toggle line num"},
		["r"] = { "<cmd>set invrelativenumber<cr>", "Toggle relative line Num"},
		["s"] = { "<cmd>set list!<cr>", "Toggle hidden sybols"},
		["w"] = { "<cmd>ToggleWhitespace<cr>", "Toggle whitespace"}
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
	},
}, { prefix = "<space>" })

