local opts = { buffer = bufnr, noremap = true, silent = true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)

vim.keymap.set('n', 'gn', ':bNext<CR>', opts)

vim.keymap.set('n', 'L', 'gt')
vim.keymap.set('n', 'H', 'gT')

vim.keymap.set(
    'n',
    '<leader>d',
    [[o<ESC>:.!date '+\%A, \%d \%B \%Y'<CR>I## <ESC>o]],
    { silent = true }
)
