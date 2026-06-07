# Neovim Keybindings Reference

**Leader key:** `<Space>`

---

## General

| Key | Mode | Action |
|-----|------|--------|
| `<Esc>` | n | Clear search highlights |
| `<leader>q` | n | Open diagnostic quickfix list |
| `<Esc><Esc>` | t | Exit terminal mode |
| `<leader>?` | n | Show buffer-local keymaps (which-key) |
| `<leader>/` | n | Fuzzy search in current buffer |

---

## Buffers (`<leader>b`)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` | n | Next buffer |
| `<S-Tab>` | n | Previous buffer |
| `<leader>bx` | n | Delete buffer |
| `<leader>bn` | n | New buffer / save without formatting |

---

## Windows (`<leader>w`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>wv` | n | Split vertical |
| `<leader>wh` | n | Split horizontal |
| `<leader>ws` | n | Equalize split sizes |
| `<leader>wx` | n | Close split |
| `<C-h>` | n | Move focus to left window |
| `<C-j>` | n | Move focus to lower window |
| `<C-k>` | n | Move focus to upper window |
| `<C-l>` | n | Move focus to right window |
| `<Up>` / `<Down>` | n | Resize split (shorter/taller) |
| `<Left>` / `<Right>` | n | Resize split (wider/narrower) |

---

## Tabs (`<leader>t`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>to` | n | Open new tab |
| `<leader>tx` | n | Close current tab |
| `<leader>tn` | n | Next tab |
| `<leader>tp` | n | Previous tab |

---

## Scrolling & Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-d>` | n | Scroll down and center cursor |
| `<C-u>` | n | Scroll up and center cursor |
| `n` | n | Next search result and center |
| `N` | n | Previous search result and center |

---

## Toggle / Local Settings (`<leader>L`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>Lw` | n | Toggle line wrap |
| `<leader>th` | n | Toggle LSP inlay hints |
| `<leader>tb` | n | Toggle git blame line |
| `<leader>tD` | n | Toggle git show deleted (inline) |

---

## Search / Telescope (`<leader>s`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>sf` | n | Search files |
| `<leader>sg` | n | Live grep |
| `<leader>sw` | n | Search current word under cursor |
| `<leader>sc` | n | Grep in current file's directory |
| `<leader>s/` | n | Live grep in open files only |
| `<leader>sd` | n | Search diagnostics |
| `<leader>sh` | n | Search help tags |
| `<leader>sk` | n | Search keymaps |
| `<leader>sn` | n | Search Neovim config files |
| `<leader>sr` | n | Resume last search |
| `<leader>s.` | n | Search recent files |
| `<leader>ss` | n | Select Telescope picker |
| `<leader><leader>` | n | Find open buffers |

### Inside Telescope (insert mode)

| Key | Action |
|-----|--------|
| `<C-j>` | Move selection down |
| `<C-k>` | Move selection up |
| `<C-l>` | Confirm selection |

---

## LSP (`<leader>l`)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ln` | n | Rename symbol |
| `<leader>la` | n / x | Code action |
| `<leader>lr` | n | Go to references |
| `<leader>li` | n | Go to implementation |
| `<leader>ld` | n | Go to definition |
| `<leader>lD` | n | Go to declaration |
| `<leader>lt` | n | Go to type definition |
| `<leader>lf` | n | Show diagnostic floating message |
| `<leader>lO` | n | Document symbols |
| `<leader>lW` | n | Workspace symbols |

---

## Git Hunks (`<leader>h`)

| Key | Mode | Action |
|-----|------|--------|
| `]c` | n | Jump to next git change |
| `[c` | n | Jump to previous git change |
| `<leader>hs` | n / v | Stage hunk |
| `<leader>hr` | n / v | Reset hunk |
| `<leader>hS` | n | Stage entire buffer |
| `<leader>hu` | n | Undo stage hunk |
| `<leader>hR` | n | Reset entire buffer |
| `<leader>hp` | n | Preview hunk |
| `<leader>hb` | n | Blame current line |
| `<leader>hd` | n | Diff against index |
| `<leader>hD` | n | Diff against last commit |

---

## Neo-tree (`<leader>e`)

| Key | Mode | Action |
|-----|------|--------|
| `\` | n | Reveal current file in Neo-tree |
| `<leader>ee` | n | Toggle Neo-tree |
| `<leader>er` | n | Reveal current file |
| `<leader>ef` | n | Focus Neo-tree |
| `<leader>ec` | n | Close Neo-tree |

### Inside Neo-tree

| Key | Action |
|-----|--------|
| `\` | Close Neo-tree window |
| `<Space>` | Open item |

---

## Debugger / DAP

| Key | Action |
|-----|--------|
| `<F5>` | Start / continue debugging |
| `<F1>` | Step into |
| `<F2>` | Step over |
| `<F3>` | Step out |
| `<F7>` | Toggle DAP UI |
| `<leader>b` | Toggle breakpoint |
| `<leader>B` | Set conditional breakpoint |

---

## Completion (blink.cmp)

Uses the `super-tab` preset.

| Key | Action |
|-----|--------|
| `<Tab>` | Accept completion / navigate to next item |
| `<S-Tab>` | Navigate to previous item |
| `<CR>` | Confirm selection |
