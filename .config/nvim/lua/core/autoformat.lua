-- Auto format Markdown
vim.api.nvim_create_augroup('MarkdownAutoformat', {})
vim.api.nvim_create_autocmd(
  --{ 'InsertLeave', 'TextChanged' },
  'BufWritePost',
  {
    pattern = '*.md',
    group = 'MarkdownAutoformat',
    callback = function()
      vim.cmd('silent !prettier --write --prose-wrap always --print-width 79 "%"')
      -- vim.cmd('silent !prettier --write --prose-wrap never "%"')
    end,
  }
)

-- Auto format code with Prettier (local .prettierrc for each project)
vim.api.nvim_create_augroup('AutoPrettierformat', {})
vim.api.nvim_create_autocmd(
  'BufWritePost',
  {
    pattern = {'*.ts', '*.tsx', '*.js', '*.jsx', '*.css', '*.html'},
    group = 'AutoPrettierformat',
    callback = function()
      vim.cmd('silent !npx prettier --write "%"')
    end,
  }
)

-- Auto format Python code with Ruff
vim.api.nvim_create_augroup('PythonAutoformat', {})
vim.api.nvim_create_autocmd(
  'BufWritePost',
  {
    pattern = {'*.py'},
    group = 'PythonAutoformat',
    callback = function()
      vim.cmd('silent !ruff format "%"')
    end,
  }
)

-- Auto format Go code with gofmt
vim.api.nvim_create_augroup('GoAutoformat', {})
vim.api.nvim_create_autocmd(
  'BufWritePost',
  {
    pattern = {'*.go'},
    group = 'GoAutoformat',
    callback = function()
      vim.cmd('silent !gofmt -w "%"')
    end,
  }
)

