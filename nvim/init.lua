require('core.keymaps')
require('core.options')

vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Build hooks must be registered before vim.pack.add so they fire on first install
vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    if ev.data.kind ~= 'install' and ev.data.kind ~= 'update' then return end
    if ev.data.spec.name == 'nvim-treesitter' then
      if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
      vim.cmd('TSUpdate')
    end
  end,
})

local specs = {
  -- Colorscheme (load first)
  'https://github.com/folke/tokyonight.nvim',

  -- Shared dependencies
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/nvim-tree/nvim-web-devicons',
  'https://github.com/MunifTanjim/nui.nvim',
  'https://github.com/moll/vim-bbye',

  -- Core editing
  'https://github.com/folke/lazydev.nvim',
  'https://github.com/lukas-reineke/indent-blankline.nvim',
  'https://github.com/folke/which-key.nvim',
  'https://github.com/echasnovski/mini.nvim',
  'https://github.com/nvim-treesitter/nvim-treesitter',
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range('*') },
  'https://github.com/akinsho/bufferline.nvim',
  'https://github.com/tiagovla/scope.nvim',
  'https://github.com/lewis6991/gitsigns.nvim',
  'https://github.com/christoomey/vim-tmux-navigator',
  'https://github.com/sindrets/diffview.nvim',
  'https://github.com/folke/todo-comments.nvim',
  'https://github.com/MagicDuck/grug-far.nvim',

  -- Telescope
  'https://github.com/nvim-telescope/telescope-ui-select.nvim',
  'https://github.com/nvim-telescope/telescope.nvim',
  'https://github.com/nvim-telescope/telescope-live-grep-args.nvim',

  -- LSP
  'https://github.com/mason-org/mason.nvim',
  'https://github.com/mason-org/mason-lspconfig.nvim',
  'https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim',
  'https://github.com/j-hui/fidget.nvim',
  'https://github.com/neovim/nvim-lspconfig',

  -- Completion
  'https://github.com/rafamadriz/friendly-snippets',
  { src = 'https://github.com/L3MON4D3/LuaSnip', version = vim.version.range('2.x') },
  { src = 'https://github.com/saghen/blink.cmp', version = vim.version.range('*') },

  -- Formatting & editing
  'https://github.com/stevearc/conform.nvim',
  'https://github.com/windwp/nvim-autopairs',
}

-- telescope-fzf-native requires `make` to build the native extension
if vim.fn.executable('make') == 1 then
  table.insert(specs, #specs - 1, 'https://github.com/nvim-telescope/telescope-fzf-native.nvim')
end

vim.pack.add(specs)

-- Plugin configuration (order: colorscheme first, then the rest)
require('plugins.colortheme')
require('plugins.bufferline')
require('plugins.mini')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.lsp')
require('plugins.blink')
require('plugins.autoformat')
require('plugins.gitsigns')
require('plugins.misc')
require('plugins.grug-far')
require('plugins.neo-tree')
require('plugins.diffview')

-- which-key (inline: needs CORE_KEYMAPS global from core.keymaps)
local wk = require('which-key')
wk.setup({
  delay = 200,
  icons = {
    mappings = vim.g.have_nerd_font,
    keys = vim.g.have_nerd_font and {} or {
      Up = '<Up> ',
      Down = '<Down> ',
      Left = '<Left> ',
      Right = '<Right> ',
      C = '<C-…> ',
      M = '<M-…> ',
      D = '<D-…> ',
      S = '<S-…> ',
      CR = '<CR> ',
      Esc = '<Esc> ',
      ScrollWheelDown = '<ScrollWheelDown> ',
      ScrollWheelUp = '<ScrollWheelUp> ',
      NL = '<NL> ',
      BS = '<BS> ',
      Space = '<Space> ',
      Tab = '<Tab> ',
      F1 = '<F1>',
      F2 = '<F2>',
      F3 = '<F3>',
      F4 = '<F4>',
      F5 = '<F5>',
      F6 = '<F6>',
      F7 = '<F7>',
      F8 = '<F8>',
      F9 = '<F9>',
      F10 = '<F10>',
      F11 = '<F11>',
      F12 = '<F12>',
    },
  },
  spec = CORE_KEYMAPS,
})
vim.keymap.set('n', '<leader>?', function()
  wk.show({ global = false })
end, { desc = 'Buffer Local Keymaps (which-key)' })

-- lazydev: Lua LSP annotations for Neovim API
require('lazydev').setup({
  library = {
    { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
  },
})

require('fidget').setup()

-- vim: ts=2 sts=2 sw=2 et
