-- ============================================================================
-- init.lua for the VSCode Neovim extension (asvetliakov.vscode-neovim)
--
-- This is a stripped-down version of your dotfiles nvim config, meant to be
-- loaded ONLY when Neovim runs embedded inside VSCode.
--
-- Recommended setup (keeps this fully separate from your terminal config):
--   1. Save this file somewhere, e.g. ~/.config/nvim-vscode/init.lua
--   2. In VSCode settings.json add:
--        "vscode-neovim.neovimInitVimPaths.darwin":
--            "/Users/<you>/.config/nvim-vscode/init.lua",
--        "vscode-neovim.neovimInitVimPaths.linux":
--            "/home/<you>/.config/nvim-vscode/init.lua"
--      (use the key matching your platform; on a remote/SSH/Docker host these
--       are the REMOTE settings, and this file must live on that host)
--
-- Alternatively, keep one config and guard everything with `if vim.g.vscode`.
-- This file assumes it is the dedicated VSCode init, so it does not guard.
--
-- What was dropped vs your full config and why:
--   * All plugin manager (vim.pack) usage — VSCode provides the UI layer:
--     colorscheme, bufferline, statusline (mini.statusline), neo-tree,
--     telescope, gitsigns, diffview, which-key, blink.cmp, LSP/mason,
--     conform/autoformat, fidget, indent-blankline, todo-comments, grug-far.
--     VSCode's own extensions replace these.
--   * LSP config — VSCode's language extensions own this. Keymaps below call
--     VSCode commands instead of vim.lsp.buf.*.
--   * tmux-navigator, scope.nvim, bufferline — window/buffer/tab management is
--     handled by VSCode; the relevant keys are remapped to VSCode commands.
--
-- What was kept: editor options that still matter to the Neovim engine, your
-- motion/editing muscle-memory keymaps, and mini.ai / mini.surround (text
-- objects + surround work great inside VSCode Neovim).
-- ============================================================================

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- ---------------------------------------------------------------------------
-- Options (only ones meaningful to the embedded engine; VSCode owns the rest)
-- ---------------------------------------------------------------------------
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.undofile = true
vim.o.scrolloff = 10
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.autoindent = true
vim.schedule(function()
  vim.o.clipboard = 'unnamedplus'
end)
-- NOTE: number, cursorline, signcolumn, list/listchars, showmode, splitright,
-- mouse, inccommand, etc. are intentionally omitted — VSCode renders the UI,
-- so setting them in the embedded instance does nothing useful.

-- ---------------------------------------------------------------------------
-- Helpers
-- ---------------------------------------------------------------------------
local opts = { noremap = true, silent = true }

-- Call a VSCode command from Neovim (no-op safety if not in VSCode)
local vscode_ok, vscode = pcall(require, 'vscode')
local function code(cmd)
  return function()
    if vscode_ok then
      vscode.action(cmd)
    end
  end
end

-- ---------------------------------------------------------------------------
-- Core editing keymaps (pure Neovim — identical to your terminal config)
-- ---------------------------------------------------------------------------
-- don't overwrite clipboard when pasting over a selection
vim.keymap.set('x', 'p', [["_dP]])

-- keep search results centered
vim.keymap.set('n', 'n', 'nzzzv', opts)
vim.keymap.set('n', 'N', 'Nzzzv', opts)
vim.keymap.set('n', '<C-d>', '<C-d>zz', opts)
vim.keymap.set('n', '<C-u>', '<C-u>zz', opts)

-- clear search highlight
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- ---------------------------------------------------------------------------
-- Keymaps remapped to VSCode commands
-- These replace your Telescope / LSP / neo-tree / gitsigns / grug-far / buffer
-- / window / tab bindings with the closest VSCode equivalent, keeping your
-- <leader> mnemonics (l = LSP, s = search, g = git, b = buffers, w = window,
-- t = tabs/toggles, e = explorer).
-- ---------------------------------------------------------------------------

-- [L]SP ----------------------------------------------------------------------
vim.keymap.set('n', '<leader>ln', code('editor.action.rename'), { desc = 'LSP: Rename' })
vim.keymap.set({ 'n', 'x' }, '<leader>la', code('editor.action.quickFix'), { desc = 'LSP: Code Action' })
vim.keymap.set('n', '<leader>lr', code('editor.action.goToReferences'), { desc = 'LSP: References' })
vim.keymap.set('n', '<leader>li', code('editor.action.goToImplementation'), { desc = 'LSP: Implementation' })
vim.keymap.set('n', '<leader>ld', code('editor.action.revealDefinition'), { desc = 'LSP: Definition' })
vim.keymap.set('n', '<leader>lD', code('editor.action.revealDeclaration'), { desc = 'LSP: Declaration' })
vim.keymap.set('n', '<leader>lt', code('editor.action.goToTypeDefinition'), { desc = 'LSP: Type Definition' })
vim.keymap.set('n', '<leader>lf', code('editor.action.showHover'), { desc = 'LSP: Hover / diagnostics' })
vim.keymap.set('n', '<leader>lO', code('workbench.action.gotoSymbol'), { desc = 'LSP: Document Symbols' })
vim.keymap.set('n', '<leader>lW', code('workbench.action.showAllSymbols'), { desc = 'LSP: Workspace Symbols' })
-- gd / gr style built-ins also work; keep your leader maps as the primary set.

-- [S]earch -------------------------------------------------------------------
vim.keymap.set('n', '<leader>sf', code('workbench.action.quickOpen'), { desc = 'Search Files' })
vim.keymap.set('n', '<leader>sg', code('workbench.action.findInFiles'), { desc = 'Search by Grep' })
vim.keymap.set('n', '<leader>ss', code('workbench.action.replaceInFiles'), { desc = 'Search & Replace' })
vim.keymap.set('n', '<leader>sw', code('editor.action.addSelectionToNextFindMatch'), { desc = 'Search current Word' })
vim.keymap.set('n', '<leader>sd', code('workbench.actions.view.problems'), { desc = 'Search Diagnostics' })
vim.keymap.set('n', '<leader>sk', code('workbench.action.openGlobalKeybindings'), { desc = 'Search Keymaps' })

-- [G]it ----------------------------------------------------------------------
vim.keymap.set('n', '<leader>gv', code('workbench.view.scm'), { desc = 'Git View (SCM)' })
vim.keymap.set('n', '<leader>gb', code('gitlens.toggleLineBlame'), { desc = 'Git Blame line' })
vim.keymap.set('n', '<leader>gh', code('gitlens.showQuickFileHistory'), { desc = 'Git History (File)' })
vim.keymap.set('n', '<leader>gkp', code('editor.action.dirtydiff.next'), { desc = 'Preview Hunk' })
vim.keymap.set('n', '<leader>gks', code('git.stageSelectedRanges'), { desc = 'Stage Hunk' })
vim.keymap.set('n', '<leader>gkr', code('git.revertSelectedRanges'), { desc = 'Reset Hunk' })
vim.keymap.set('n', '[c', code('workbench.action.editor.previousChange'), { desc = 'Prev change' })
vim.keymap.set('n', ']c', code('workbench.action.editor.nextChange'), { desc = 'Next change' })
-- NOTE: gitlens.* commands require the GitLens extension. The plain git.*
-- commands are built into VSCode's Git extension.

-- [E]xplorer (neo-tree replacement) ------------------------------------------
vim.keymap.set('n', '<leader>e', code('workbench.view.explorer'), { desc = 'Toggle Explorer' })

-- [B]uffers (VSCode "editors") -----------------------------------------------
vim.keymap.set('n', '<Tab>', code('workbench.action.nextEditor'), { desc = 'Next editor' })
vim.keymap.set('n', '<S-Tab>', code('workbench.action.previousEditor'), { desc = 'Prev editor' })
vim.keymap.set('n', '<leader>bx', code('workbench.action.closeActiveEditor'), { desc = 'Close editor' })
vim.keymap.set('n', '<leader>bn', code('workbench.action.files.newUntitledFile'), { desc = 'New file' })
vim.keymap.set('n', '<leader>bs', code('workbench.action.files.save'), { desc = 'Save' })

-- [W]indow (VSCode editor groups) --------------------------------------------
vim.keymap.set('n', '<leader>wv', code('workbench.action.splitEditorRight'), { desc = 'Split vertical' })
vim.keymap.set('n', '<leader>wh', code('workbench.action.splitEditorDown'), { desc = 'Split horizontal' })
vim.keymap.set('n', '<leader>wx', code('workbench.action.closeEditorsInGroup'), { desc = 'Close split' })
vim.keymap.set('n', '<leader>ws', code('workbench.action.evenEditorWidths'), { desc = 'Even splits' })
-- Focus movement between editor groups (replaces your <C-hjkl> tmux-navigator).
vim.keymap.set('n', '<C-h>', code('workbench.action.focusLeftGroup'), { desc = 'Focus left group' })
vim.keymap.set('n', '<C-l>', code('workbench.action.focusRightGroup'), { desc = 'Focus right group' })
vim.keymap.set('n', '<C-j>', code('workbench.action.focusBelowGroup'), { desc = 'Focus below group' })
vim.keymap.set('n', '<C-k>', code('workbench.action.focusAboveGroup'), { desc = 'Focus above group' })

-- [T]abs / toggles -----------------------------------------------------------
-- VSCode has no 1:1 "tab" concept; map to editor groups / wrap toggle.
vim.keymap.set('n', '<leader>tw', code('editor.action.toggleWordWrap'), { desc = 'Toggle Wrap' })
vim.keymap.set('n', '<leader>to', code('workbench.action.newGroupRight'), { desc = 'New editor group' })
vim.keymap.set('n', '<leader>tx', code('workbench.action.closeGroup'), { desc = 'Close group' })
vim.keymap.set('n', '<leader>tn', code('workbench.action.focusNextGroup'), { desc = 'Next group' })
vim.keymap.set('n', '<leader>tp', code('workbench.action.focusPreviousGroup'), { desc = 'Prev group' })

-- Diagnostics quickfix -> VSCode Problems panel
vim.keymap.set('n', '<leader>q', code('workbench.actions.view.problems'), { desc = 'Problems list' })

-- ---------------------------------------------------------------------------
-- Plugins worth keeping inside VSCode Neovim
-- Install these via a minimal plugin manager (lazy.nvim/vim.pack) in THIS
-- config, or skip if you'd rather stay plugin-free. They operate on buffer
-- text, so they behave correctly under VSCode Neovim.
--   * mini.ai      — extra text objects (a/i for args, brackets, etc.)
--   * mini.surround— add/delete/replace surrounding pairs (sa, sd, sr)
-- If you don't wire up a plugin manager, delete the block below.
-- ---------------------------------------------------------------------------
local ok_ai, mini_ai = pcall(require, 'mini.ai')
if ok_ai then
  mini_ai.setup({ n_lines = 500 })
end
local ok_surround, mini_surround = pcall(require, 'mini.surround')
if ok_surround then
  mini_surround.setup()
end

-- vim: ts=2 sts=2 sw=2 et
