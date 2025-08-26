-- Lazy should be the first
require('core.lazy')

require('core.settings')
require('core.keymaps')
require('core.lsp')

require('core.autoformat')
require('core.autoindents')
require('core.autosave')
require('core.run-code')

require('plugins.mini')
require('plugins.nvim-cmp')
require('plugins.nvim-tree')
require('plugins.telescope')
