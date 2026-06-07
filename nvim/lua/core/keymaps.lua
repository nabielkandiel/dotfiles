vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.g.have_nerd_font = true

-- [[ Basic Keymaps ]]
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

local opts = { noremap = true, silent = true }

-- save without formatting
vim.keymap.set('n', '<leader>bn', '<cmd>noautocmd w <CR>', opts)

-- vertical scroll and center
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- find and center
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)

-- Buffers
vim.keymap.set('n', '<Tab>', ':bnext<CR>', opts)
vim.keymap.set('n', '<S-Tab>', ':bprevious<CR>', opts)

local function smart_close()
  local ok, scope = pcall(require, 'scope')
  if ok and scope.close_buffer then
    scope.close_buffer()
  else
    if vim.fn.exists(':Bdelete') == 2 then
      vim.cmd('Bdelete')
    else
      vim.cmd('bdelete')
    end
  end
end

vim.keymap.set('n', '<leader>bx', smart_close, { desc = 'Close buffer (Smart)' })
vim.keymap.set('n', '<leader>bn', '<cmd> enew <CR>', opts)

-- Window Managment
-- v/hsplit, equal size and close
vim.keymap.set('n', '<leader>wv', '<C-w>v', opts)
vim.keymap.set('n', '<leader>wh', '<C-w>s', opts)
vim.keymap.set('n', '<leader>ws', '<C-W>=', opts)
vim.keymap.set('n', '<leader>wx', ':close<CR>', opts)

-- Tabs
vim.keymap.set('n', '<leader>to', ':tabnew<CR>', opts) -- open new tab
vim.keymap.set('n', '<leader>tx', ':tabclose<CR>', opts) -- close current tab
vim.keymap.set('n', '<leader>tn', ':tabn<CR>', opts) -- go to next tab
vim.keymap.set('n', '<leader>tp', ':tabp<CR>', opts) -- go to previous tab

-- Toggle line wrapping
vim.keymap.set('n', '<leader>tw', '<cmd>set wrap!<CR>', opts)

-- Git (Fugitive & Gitsigns)
vim.keymap.set('n', '<leader>gs', vim.cmd.Git, { desc = 'Git [S]tatus' })
vim.keymap.set('n', '<leader>gd', '<cmd>Gdiffsplit<CR>', { desc = 'Git [D]iff split' })
vim.keymap.set('n', '<leader>gb', '<cmd>G blame<CR>', { desc = 'Git [B]lame' })
vim.keymap.set('n', '<leader>gc', '<cmd>Git commit<CR>', { desc = 'Git [C]ommit' })
vim.keymap.set('n', '<leader>gp', '<cmd>Git push<CR>', { desc = 'Git [P]ush' })

CORE_KEYMAPS = {
  { '<leader>g', group = '[G]it' },
  { '<leader>gs', desc = 'Git Status' },
  { '<leader>gd', desc = 'Git Diff Split' },
  { '<leader>gb', desc = 'Git Blame' },
  { '<leader>gc', desc = 'Git Commit' },
  { '<leader>gp', desc = 'Git Push' },
  { '<leader>gh', group = '[H]unk' },
  { '<leader>ghp', desc = 'Preview Hunk' },
  { '<leader>ghs', desc = 'Stage Hunk' },
  { '<leader>ghr', desc = 'Reset Hunk' },
  { '<leader>ghu', desc = 'Undo Stage Hunk' },
  { '<leader>ghS', desc = 'Stage Buffer' },
  { '<leader>ghR', desc = 'Reset Buffer' },
  { '<leader>ghb', desc = 'Blame Line' },
  { '<leader>ghd', desc = 'Diff against Index' },
  { '<leader>ghD', desc = 'Diff against last Commit' },
  { '<leader>gt', group = '[T]oggle' },
  { '<leader>gtb', desc = 'Toggle Blame line' },
  { '<leader>gtd', desc = 'Toggle Deleted' },
  { '<leader>w', group = '[W]indow' },
  { '<leader>wv', desc = 'Split Window Vertical' },
  { '<leader>wh', desc = 'Split Window Horizontal' },
  { '<leader>ws', desc = 'Make Split Same Size' },
  { '<leader>wx', desc = 'Close Split' },
  { '<leader>wn', desc = 'save no formatting' },
  { '<leader>b', group = '[B]uffers' },
  { '<leader>b<Tab>', desc = 'next buffer' },
  { '<leader>b<S-Tab>', desc = 'prev buffer' },
  { '<leader>bx', desc = 'close buffer (smart)' },
  { '<leader>bn', desc = 'new buffer' },
  { '<leader>bf', desc = 'save buffer (no format)' },
  { '<leader>l', group = '[L]SP' },
  { '<leader>ln', desc = 'Re[n]ame buffer' },
  { '<leader>la', desc = 'Goto code [a]ction' },
  { '<leader>lr', desc = 'Goto [r]eference' },
  { '<leader>li', desc = 'Goto [i]mplementation' },
  { '<leader>ld', desc = 'Goto [d]efinition' },
  { '<leader>lD', desc = 'Goto [D]eclaration' },
  { '<leader>lf', desc = 'Show diagnostic [f]loating message' },
  { '<leader>lO', desc = '[O]pen document symbols' },
  { '<leader>lW', desc = 'Open [W]orkspace symbols' },
  { '<leader>lt', desc = 'Goto [t]ype definition' },
  { '<leader>s', group = '[S]earch' },
  { '<leader>t', group = '[T]oggle' },
  { '<leader>e', group = 'Neo-tree' },
  { '<leader>tw', desc = 'set [w]rap' },
  { '<leader>to', desc = 'open new tab' },
  { '<leader>tx', desc = 'close current tab' },
  { '<leader>tn', desc = 'go to next tab' },
  { '<leader>tp', desc = 'go to previous tab' },
}
-- Keybinds to make split navigation easier.
--   Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
--   resize split with arrow keys
vim.keymap.set('n', '<Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<Left>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<Right>', ':vertical resize -2<CR>', opts)

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
