-- Indents in files of different types
vim.api.nvim_create_augroup('Indents', {})
vim.api.nvim_create_autocmd(
    'Filetype',
    {
      pattern = {
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
        'css',
        'lua',
        'kdl',
      },
      group = 'Indents',
      command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2',
    }
)

