return {
  'github/copilot.vim',
  config = function()
    -- Optional keymap: toggle Copilot
    vim.keymap.set('n', '<leader>ac', ':Copilot toggle<CR>', { desc = 'Toggle Copilot' })
  end,
}
