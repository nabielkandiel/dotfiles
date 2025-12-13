-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  lazy = false,
  keys = {
    -- Actual commands that will show under <leader>e
    { '<leader>ee', '<cmd>Neotree toggle<CR>', desc = 'Toggle', silent = true },
    { '<leader>er', '<cmd>Neotree reveal<CR>', desc = 'Reveal file', silent = true },
    { '<leader>ef', '<cmd>Neotree focus<CR>', desc = 'Focus', silent = true },
    { '<leader>ec', '<cmd>Neotree close<CR>', desc = 'Close', silent = true },

    -- Your old mapping kept as a fast shortcut
    { '\\', '<cmd>Neotree reveal<CR>', desc = 'Neo-tree reveal', silent = true },
  },
  opts = {
    window = {
      position = 'left',
      width = 32,
      auto_resize = true,
    },
    filesystem = {
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = 'disabled',
      window = {
        mappings = {
          ['\\'] = 'close_window',
          ['<space>'] = 'open',
        },
      },
    },
  },
}
