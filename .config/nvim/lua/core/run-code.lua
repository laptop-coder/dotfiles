local opts = { buffer = true, silent = true }

-- Run Python code with Ctrl+H
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'python',
    callback = function()
      vim.keymap.set('n', '<C-h>', ':w<CR>:!python "%"<CR>', opts)
      vim.keymap.set('i', '<C-h>', '<ESC>:w<CR>:!python "%"<CR>', opts)
    end,
  }
)

-- Run Go code with Ctrl+H
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'go',
    callback = function()
      vim.keymap.set('n', '<C-h>', ':w<CR>:!go run "%"<CR>', opts)
      vim.keymap.set('i', '<C-h>', '<ESC>:w<CR>:!go run "%"<CR>', opts)
    end,
  }
)

-- Run C++ code with Ctrl+H
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'cpp',
    callback = function()
      vim.keymap.set('n', '<C-h>', ':w<CR>:!c++ "%" -o "./._____temp_____output_____file_____"<CR>:!"./._____temp_____output_____file_____"<CR>:!rm "./._____temp_____output_____file_____"<CR>', opts)
      vim.keymap.set('i', '<C-h>', '<ESC>:w<CR>:!c++ "%" -o "./._____temp_____output_____file_____"<CR>:!"./._____temp_____output_____file_____"<CR>:!rm "./._____temp_____output_____file_____"<CR>', opts)
    end,
  }
)

-- Run TypeScript/JavaScript code with Ctrl+H
vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = {'typescript', 'javascript'},
    callback = function()
      vim.keymap.set('n', '<C-h>', ':w<CR>:!node "%"<CR>', opts)
      vim.keymap.set('i', '<C-h>', '<ESC>:w<CR>:!node "%"<CR>', opts)
    end,
  }
)
