require('conform').setup({
  notify_on_error = false,
  format_on_save = function(bufnr)
    local disable_filetypes = { c = false, cpp = false }
    if disable_filetypes[vim.bo[bufnr].filetype] then
      return nil
    else
      return {
        timeout_ms = 500,
        lsp_format = 'fallback',
      }
    end
  end,
  formatters_by_ft = {
    lua = { 'stylua' },
    python = { 'isort', 'black' },
    javascript = { 'prettierd', 'prettier', stop_after_first = true },
    typescript = { 'prettierd', 'prettier', stop_after_first = true },
    javascriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    typescriptreact = { 'prettierd', 'prettier', stop_after_first = true },
    cpp = { 'clang-format' },
    c = { 'clang-format' },
  },
})

vim.keymap.set('', '<leader>f', function()
  require('conform').format({ async = true, lsp_format = 'fallback' })
end, { desc = '[F]ormat buffer' })
