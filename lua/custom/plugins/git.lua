-- VS Code-style Git commands for Neovim

-- Helper function to run git commands in a terminal
local function run_git_command(cmd, desc)
  vim.cmd 'botright split | resize 15'
  vim.fn.jobstart(cmd, {
    on_exit = function(_, exit_code)
      if exit_code == 0 then
        vim.notify(desc .. ' completed successfully!', vim.log.levels.INFO)
      else
        vim.notify(desc .. ' failed!', vim.log.levels.ERROR)
      end
    end,
    pty = true,
  })
  vim.cmd 'startinsert'
end

-- Git status (like opening Source Control in VS Code)
vim.keymap.set('n', '<leader>gs', function()
  run_git_command('git status', 'Git Status')
end, { desc = '[G]it [S]tatus' })

-- Git add current file (stage current file)
vim.keymap.set('n', '<leader>ga', function()
  local file = vim.fn.expand '%'
  vim.cmd 'write' -- save first
  vim.fn.system('git add ' .. file)
  vim.notify('Staged: ' .. file, vim.log.levels.INFO)
end, { desc = '[G]it [A]dd current file' })

-- Git add all (stage all changes)
vim.keymap.set('n', '<leader>gA', function()
  vim.cmd 'wall' -- save all
  vim.fn.system 'git add .'
  vim.notify('Staged all changes', vim.log.levels.INFO)
end, { desc = '[G]it [A]dd all' })

-- Git commit (opens terminal for commit message)
vim.keymap.set('n', '<leader>gc', function()
  vim.ui.input({ prompt = 'Commit message: ' }, function(msg)
    if msg and msg ~= '' then
      local result = vim.fn.system('git commit -m "' .. msg .. '"')
      if vim.v.shell_error == 0 then
        vim.notify('Committed: ' .. msg, vim.log.levels.INFO)
      else
        vim.notify('Commit failed: ' .. result, vim.log.levels.ERROR)
      end
    end
  end)
end, { desc = '[G]it [C]ommit' })

-- Git commit all (stage + commit in one go)
vim.keymap.set('n', '<leader>gC', function()
  vim.ui.input({ prompt = 'Commit message (will stage all): ' }, function(msg)
    if msg and msg ~= '' then
      vim.cmd 'wall'
      vim.fn.system 'git add .'
      local result = vim.fn.system('git commit -m "' .. msg .. '"')
      if vim.v.shell_error == 0 then
        vim.notify('Staged all & committed: ' .. msg, vim.log.levels.INFO)
      else
        vim.notify('Commit failed: ' .. result, vim.log.levels.ERROR)
      end
    end
  end)
end, { desc = '[G]it stage all + [C]ommit' })

-- Git push
vim.keymap.set('n', '<leader>gp', function()
  run_git_command('git push', 'Git Push')
end, { desc = '[G]it [P]ush' })

-- Git pull
vim.keymap.set('n', '<leader>gl', function()
  run_git_command('git pull', 'Git Pull')
end, { desc = '[G]it Pul[l]' })

-- Git sync (pull then push - like VS Code sync)
vim.keymap.set('n', '<leader>gy', function()
  run_git_command('git pull && git push', 'Git Sync')
end, { desc = '[G]it S[y]nc (pull + push)' })

-- Git diff current file
vim.keymap.set('n', '<leader>gd', function()
  require('gitsigns').diffthis()
end, { desc = '[G]it [D]iff current file' })

-- Git log (pretty format)
vim.keymap.set('n', '<leader>go', function()
  run_git_command('git log --oneline --graph --decorate --all -20', 'Git Log')
end, { desc = '[G]it L[o]g' })

-- Git blame current line (already exists from gitsigns, but adding for completeness)
vim.keymap.set('n', '<leader>gb', function()
  require('gitsigns').blame_line { full = true }
end, { desc = '[G]it [B]lame line' })

-- Quick commit & push (most common workflow)
vim.keymap.set('n', '<leader>gq', function()
  vim.ui.input({ prompt = 'Quick commit & push message: ' }, function(msg)
    if msg and msg ~= '' then
      vim.cmd 'wall'
      vim.fn.system 'git add .'
      vim.fn.system('git commit -m "' .. msg .. '"')
      if vim.v.shell_error == 0 then
        vim.notify('Committed: ' .. msg .. ' - Now pushing...', vim.log.levels.INFO)
        run_git_command('git push', 'Git Push')
      else
        vim.notify('Commit failed!', vim.log.levels.ERROR)
      end
    end
  end)
end, { desc = '[G]it [Q]uick commit + push' })

return {}
