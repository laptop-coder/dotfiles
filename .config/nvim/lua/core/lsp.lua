vim.lsp.config('rust_analyzer', {
    -- on_attach = function(client, bufnr)
    --     vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
    -- end
})

vim.lsp.config('*', {
  offset_encoding = 'utf-8'
})

vim.lsp.enable({
  'clangd',
  'gopls',
  'pyright',
  'ruff',
  'rust_analyzer',
  'tinymist',
  'ts_ls',
})
