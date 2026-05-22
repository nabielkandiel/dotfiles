-- Load friendly-snippets into LuaSnip
require('luasnip.loaders.from_vscode').lazy_load()

require('blink.cmp').setup({
  keymap = {
    preset = 'super-tab',
  },

  appearance = {
    nerd_font_variant = 'mono',
  },

  completion = {
    documentation = { auto_show = false, auto_show_delay_ms = 500 },
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'lazydev' },
    providers = {
      lazydev = { module = 'lazydev.integrations.blink', score_offset = 100 },
    },
  },

  snippets = { preset = 'luasnip' },

  fuzzy = { implementation = 'prefer_rust_with_warning' },

  signature = { enabled = true },
})
