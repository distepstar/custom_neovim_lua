local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
  return
end


local lsp_formatting = function(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == 'prettier'
    end,
    bufnr = bufnr,
  })
end



null_ls.setup({
  debug = false,
  sources = {
    null_ls.builtins.formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    null_ls.builtins.formatting.black.with({ extra_args = { "--fast" } }),
    null_ls.builtins.formatting.stylua,
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
          lsp_formatting(bufnr)
          vim.lsp.buf.format()
        end,
      })
    end
  end,
})
