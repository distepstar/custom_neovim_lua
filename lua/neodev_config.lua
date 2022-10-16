local status_ok, neodev = pcall(require, "neodev")

if not status_ok then
	return
end


neodev.setup({
  -- add any options here, or leave empty to use the default settings
})

-- then setup your lsp server as usual

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
  return
end

-- example to setup sumneko and enable call snippets
lspconfig.sumneko_lua.setup({
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace"
      }
    }
  }
})
