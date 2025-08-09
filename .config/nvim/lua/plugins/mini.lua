require('mini.ai').setup()
require('mini.comment').setup()
require('mini.files').setup()
require('mini.pairs').setup()
require('mini.trailspace').setup()
vim.keymap.set('n', '<leader>e', ':lua MiniFiles.open(vim.fn.expand("%:p:h"))<CR>', { silent = true })

