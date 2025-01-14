-- vim.g.mapleader = "<Space>"
vim.g.mapleader = " "

-- require
require("config.lazy")

vim.opt.autochdir = true

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })

-- obsidian
vim.opt.conceallevel = 1
vim.api.nvim_create_user_command('Ot', 'ObsidianToday', {})
vim.api.nvim_create_user_command('Os', 'ObsidianQuickSwitch', {})
vim.api.nvim_create_user_command('OT', 'ObsidianTemplate', {})
vim.api.nvim_set_keymap('n', '<Leader>ot', ':ObsidianToday<CR>', { noremap = true, silent = true })

