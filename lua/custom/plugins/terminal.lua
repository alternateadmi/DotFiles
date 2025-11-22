-- VS Code-style toggle terminal (vim-friendly keybinds)
local terminal_buf = nil
local terminal_win = nil

local function toggle_terminal()
  -- If terminal window is visible, close it
  if terminal_win and vim.api.nvim_win_is_valid(terminal_win) then
    vim.api.nvim_win_hide(terminal_win)
    terminal_win = nil
    return
  end

  -- If terminal buffer doesn't exist or is invalid, create new one
  if not terminal_buf or not vim.api.nvim_buf_is_valid(terminal_buf) then
    -- Create new buffer
    terminal_buf = vim.api.nvim_create_buf(false, true)

    -- Open terminal in split at bottom
    vim.cmd 'botright split'
    terminal_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
    vim.api.nvim_win_set_height(terminal_win, 15)

    -- Start terminal
    vim.fn.termopen(vim.o.shell)

    -- Enter insert mode
    vim.cmd 'startinsert'
  else
    -- Reopen existing terminal buffer
    vim.cmd 'botright split'
    terminal_win = vim.api.nvim_get_current_win()
    vim.api.nvim_win_set_buf(terminal_win, terminal_buf)
    vim.api.nvim_win_set_height(terminal_win, 15)
    vim.cmd 'startinsert'
  end
end

-- Primary: Space + t + t (like Space + f + f for find files)
vim.keymap.set('n', '<leader>tt', toggle_terminal, {
  noremap = true,
  silent = true,
  desc = '[T]oggle [T]erminal',
})

-- Alternative: Space + j (j for "jump to terminal", home row!)
vim.keymap.set('n', '<leader>j', toggle_terminal, {
  noremap = true,
  silent = true,
  desc = 'Toggle Terminal (jump)',
})

-- From terminal mode: jk to exit (vim-style)
vim.keymap.set('t', 'jk', '<C-\\><C-n>', {
  noremap = true,
  desc = 'Exit terminal mode',
})

-- From terminal mode: Space + j to hide terminal
vim.keymap.set('t', '<leader>j', '<C-\\><C-n>:lua vim.api.nvim_win_hide(vim.api.nvim_get_current_win())<CR>', {
  noremap = true,
  silent = true,
  desc = 'Hide terminal',
})

return {}
