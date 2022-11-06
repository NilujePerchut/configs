-- ------------------------
-- Cmp stuff
-- ------------------------

local status_ok, cmp = pcall(require, "cmp")
if not status_ok then
  return
end

cmp.setup({
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm { select = true },
	}),
	sources = {
		{ name ="nvim_lua" },
		{ name ="nvim_lsp" },
		{ name ="path" },
		{ name ="buffer", keyword_length = 5 },
	},
	experimental = {
		native_menu = false,
		ghost_text = true,
	},
})

