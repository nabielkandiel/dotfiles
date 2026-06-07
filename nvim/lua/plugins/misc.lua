-- vim-tmux-navigator and vim-fugitive need no setup calls
require('todo-comments').setup({ signs = false })
require('scope').setup()
require('grug-far').setup({
  windowCreationCommand = 'tabedit',
  keymaps = {
    -- Reassign these so they don't conflict with your global Tab buffer switching
    gotoNextInput = '<C-n>',
    gotoPrevInput = '<C-p>',
  },
})
