require('neo-tree').setup({
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
})

vim.keymap.set('n', '<leader>ee', '<cmd>Neotree toggle<CR>', { desc = 'Toggle', silent = true })
vim.keymap.set('n', '<leader>er', '<cmd>Neotree reveal<CR>', { desc = 'Reveal file', silent = true })
vim.keymap.set('n', '<leader>ef', '<cmd>Neotree focus<CR>', { desc = 'Focus', silent = true })
vim.keymap.set('n', '<leader>ec', '<cmd>Neotree close<CR>', { desc = 'Close', silent = true })
vim.keymap.set('n', '\\', '<cmd>Neotree reveal<CR>', { desc = 'Neo-tree reveal', silent = true })
