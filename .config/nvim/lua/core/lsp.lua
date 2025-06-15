vim.lsp.config('rust_analyzer', {
    -- on_attach = function(client, bufnr)
    --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    -- end
})

vim.lsp.enable({
  'pyright',
  'clangd',
  'ruff',
  'ts_ls',
  'rust_analyzer',
  'gopls',
})
