return {
  config = function()
    vim.keymap.set('n', '<leader>r', ':!python3 %<CR>', { noremap = true, silent = true, desc = 'Run Python file' })
  end,
}
