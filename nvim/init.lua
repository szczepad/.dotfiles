vim.opt.termguicolors = true

require('szczepad.options')
require('szczepad.keymaps')
require('szczepad.plugins')
require('szczepad.cmp')
require('szczepad.lsp')
require('szczepad.telescope')
require('szczepad.treesitter')
require('szczepad.autopairs')
require('szczepad.comment')
require('szczepad.gitsigns')
require('szczepad.nvim-tree')
require('szczepad.bufferline')
require('szczepad.toggleterm')
require('szczepad.lualine')

vim.cmd.colorscheme('gruvbox')
