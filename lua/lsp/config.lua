local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

local lspconfig = require("lspconfig")

local servers = { "jsonls", "sumneko_lua", "tsserver", "tailwindcss", "pylsp" }

lsp_installer.setup({
	ensure_installed = servers,
    automatic_installation = true, -- automatically detect which servers to install (based on which servers are set up via lspconfig)
    ui = {
        border= "none",
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

for _, server in pairs(servers) do
	local opts = {
		on_attach = require("lsp.handlers").on_attach,
		capabilities = require("lsp.handlers").capabilities,
	}

    -- for custom language settings
	local has_custom_opts, server_custom_opts = pcall(require, "lsp.settings." .. server)
	if has_custom_opts then
		opts = vim.tbl_deep_extend("force", opts, server_custom_opts)
	end
	lspconfig[server].setup(opts)
end
