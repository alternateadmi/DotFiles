-- Run Python in a terminal split (allows input)
vim.keymap.set('n', '<leader>r', function()
  -- Save the file first
  vim.cmd 'write'
  -- Open terminal in horizontal split and run Python
  vim.cmd('split | terminal python3 ' .. vim.fn.expand '%')
  -- Enter insert mode in terminal automatically
  vim.cmd 'startinsert'
end, {
  noremap = true,
  desc = 'Run Python file in terminal',
})

-- Alternative: Run in floating terminal
vim.keymap.set('n', '<leader>R', function()
  vim.cmd 'write'
  -- Create a floating terminal
  local buf = vim.api.nvim_create_buf(false, true)
  local width = math.floor(vim.o.columns * 0.8)
  local height = math.floor(vim.o.lines * 0.8)
  local row = math.floor((vim.o.lines - height) / 2)
  local col = math.floor((vim.o.columns - width) / 2)

  vim.api.nvim_open_win(buf, true, {
    relative = 'editor',
    width = width,
    height = height,
    row = row,
    col = col,
    style = 'minimal',
    border = 'rounded',
  })

  vim.fn.termopen('python3 ' .. vim.fn.expand '#')
  vim.cmd 'startinsert'
end, {
  noremap = true,
  desc = 'Run Python in floating terminal',
})

return {}
