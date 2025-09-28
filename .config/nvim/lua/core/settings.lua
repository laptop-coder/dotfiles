--─────General─Settings────────────────────────────────────────────────────────

-- Encoding
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

-- Indents
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.autoindent = true

-- Lines width
vim.opt.textwidth = 79
vim.cmd('set colorcolumn=79')
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'typst',
    callback = function()
      vim.opt.textwidth = 0
      vim.cmd('set colorcolumn=0')
    end,
  }
)

-- Other
vim.opt.scrolloff = 7
vim.opt.swapfile = false

--─────Styles──────────────────────────────────────────────────────────────────

vim.opt.hlsearch = false
vim.opt.number = true
vim.opt.ruler = false
vim.opt.showcmd = true
vim.opt.termguicolors = true

vim.opt.fillchars='eob: '  -- remove '~'
vim.opt.shortmess:append('I')  -- remove startup message

vim.cmd('colorscheme gruvbox')

vim.cmd([[
  highlight Normal guibg=NONE ctermbg=NONE
  highlight NonText guibg=NONE ctermbg=NONE
  highlight LineNr guibg=NONE ctermbg=NONE
  highlight EndOfBuffer guibg=NONE ctermbg=NONE
]])

