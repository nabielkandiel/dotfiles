require('diffview').setup({
  enhanced_diff_hl = true,
  view = {
    merge_tool = {
      layout = 'diff3_mixed',
    },
  },
})

vim.keymap.set('n', '<leader>gv', '<cmd>DiffviewOpen<CR>', { desc = 'Git [V]iew (Diffview)' })
vim.keymap.set('n', '<leader>gh', '<cmd>DiffviewFileHistory %<CR>', { desc = 'Git [H]istory (File)' })
