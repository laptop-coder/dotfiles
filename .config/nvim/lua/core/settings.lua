vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.scrolloff = 7
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.swapfile = false
vim.opt.ruler = false
vim.opt.showcmd = true
vim.opt.shortmess:append('I')  -- remove startup message
vim.opt.fillchars='eob: '  -- remove '~'
vim.opt.termguicolors = true
vim.opt.hlsearch = false
vim.opt.textwidth = 79
vim.cmd('set colorcolumn=79')
vim.cmd('colorscheme gruvbox')
vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

-- Autosave
vim.api.nvim_create_autocmd({ 'InsertLeave', 'TextChanged' }, {
  callback = function()
    if #vim.api.nvim_buf_get_name(0) ~= 0 and vim.bo.buflisted then
      vim.cmd 'silent w'
    end
  end,
})

-- Auto format Markdown
vim.api.nvim_create_augroup('MarkdownAutoFormat', {})
vim.api.nvim_create_autocmd(
  --{ 'InsertLeave', 'TextChanged' },
  'BufWritePost',
  {
    pattern = '*.md',
    group = 'MarkdownAutoFormat',
    callback = function()
      vim.cmd('silent !prettier --write --prose-wrap always --print-width 79 "%"')
    end,
  }
)

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

