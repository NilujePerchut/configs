-- ------------------------
-- LSP infra
-- ------------------------

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
	local status_ok, whichkey = pcall(require, "wich-key")
	if not status_ok then
		return
	end
  whichkey.register({
    ["l"] = {
      name = "Lang",
      ["D"] = { vim.lsp.buf.declaration, "Go to declaration"},
      ["d"] = { vim.lsp.buf.definition, "Go to definition"},
      ["h"] = { vim.lsp.buf.hover, "Signature"},
      ["n"] = { vim.lsp.buf.rename, "Rename"},
      ["r"] = { vim.lsp.buf.references, "References"},
    }
  }, { prefix = "<space>" })
end

-- Python LSP config
local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
	return
end
lspconfig["pyright"].setup{
  on_attach = on_attach,
}

-- C LSP config
lspconfig["clangd"].setup{
  on_attach = on_attach,
  cmd = {
    "clangd",
    "--query-driver=/usr/bin/arm-none-eabi-gcc,/usr/bin/gcc,/usr/bin/g++,usr/bin/clang,/usr/bin/clang++",
  }
}

-- Lua LSP config
lspconfig.sumneko_lua.setup{
  on_attach = on_attach,
  settings = {
    Lua = {
      diagnostics = {
        globals = {"vim"},
      }
    }
  }
}

-- Use Mason to install LSPs
local status_ok, mason = pcall(require, "mason")
if not status_ok then
	return
end
mason.setup()

