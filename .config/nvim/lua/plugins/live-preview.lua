-- Auto open and close Markdown preview
vim.api.nvim_create_augroup('MarkdownPreviewStart', {})
vim.api.nvim_create_autocmd(
  'BufEnter',
  {
    pattern = '*.md',
    group = 'MarkdownPreviewStart',
    command = 'silent LivePreview start'
  }
)
vim.api.nvim_create_augroup('MarkdownPreviewStop', {})
vim.api.nvim_create_autocmd(
  { 'BufDelete', 'BufLeave', 'ExitPre' },
  {
    pattern = '*.md',
    group = 'MarkdownPreviewStop',
    callback = function()
      vim.cmd("silent !pgrep -a epiphany | grep 'http://localhost:5500/%' | awk '{print $1}' | xargs kill")
      vim.cmd('silent LivePreview close')
    end,
  }
)

require('livepreview.config').set(
  {
    port = 5500,
    browser = 'epiphany',
    dynamic_root = false,
    sync_scroll = true,
    picker = "",
  }
)
