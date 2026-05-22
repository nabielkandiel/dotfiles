---@diagnostic disable-next-line: missing-fields
require('nvim-treesitter').setup({
  ensure_installed = {
    'bash',
    'c',
    'cpp',
    'diff',
    'html',
    'lua',
    'luadoc',
    'markdown',
    'markdown_inline',
    'python',
    'query',
    'rust',
    'vim',
    'vimdoc',
  },
  auto_install = true,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { 'ruby' },
  },
  indent = { enable = true, disable = { 'ruby' } },
})
