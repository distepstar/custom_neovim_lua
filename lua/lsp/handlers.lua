M = {}


M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = "" },
    { name = "DiagnosticSignWarn", text = "" },
    { name = "DiagnosticSignHint", text = "" },
    { name = "DiagnosticSignInfo", text = "" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  local config = {
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  }

  vim.diagnostic.config(config)

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
    width = 60,
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
    width = 60,
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  local status_ok, illuminate = pcall(require, "illuminate")
  if not status_ok then
    return
  end
  illuminate.on_attach(client)
  -- end
end

local lsp_keybinds = function(bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  local wk_status_ok, wk = pcall(require, 'which-key')
  if not wk_status_ok then
    return
  end

  wk.register({
    ['<leader>'] = {
      l = {
        name = "LSP Actions",
        D = "Declaration",
        d = "Defintion",
        h = "Hover",
        i = "Implementation",
        s = "Signature Help",
        n = "Add Workspace Folder",
        m = "Remove Workspace Folder",
        l = "List Workspace Folders",
        t = "Type Definition",
        r = "Rename",
        a = "Code Action",
        R = "Reference",
        f = "Format"
      }
    }
  })
  vim.keymap.set('n', '<leader>lD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>li', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>ln', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>lm', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>ll', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<leader>lt', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>lr', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>la', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>lR', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>lf', function() vim.lsp.buf.format { async = true } end, bufopts)
end


M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.server_capabilities.documentFormattingProvider = false
  end
  -- set keybinds
  lsp_keybinds(bufnr)
  -- highlight selected words that are matched the regex
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
