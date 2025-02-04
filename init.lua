-- vim.g.mapleader = "<Space>"
vim.g.mapleader = " "

-- require
require("config.lazy")

vim.opt.autochdir = true

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

-- Obsidian
vim.opt.conceallevel = 1
vim.api.nvim_set_keymap('n', '<Leader>ot', ':ObsidianToday<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>oo', ':ObsidianQuickSwitch<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ote', ':ObsidianTemplate<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>on', ':ObsidianNew<CR>', { noremap = true, silent = true })

vim.cmd("command! Ot ObsidianToday")
vim.cmd("command! Oo ObsidianQuickSwitch")
vim.cmd("command! OT ObsidianTemplate")
vim.api.nvim_create_user_command("On", function(opts)
    if opts.args == "" then
      vim.cmd("ObsidianNew")
    else
      vim.cmd("ObsidianNew " .. vim.fn.shellescape(opts.args))
    end
  end, { nargs = "?" }) -- `?` allows 0 or 1 argument
  vim.cmd("command! Ob ObsidianBacklinks")