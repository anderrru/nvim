vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = 'file explorer'} )
-- Slightly advanced example of overriding default behavior and theme

local builtin = require 'telescope.builtin'
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
	winblend = 10,
	previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set("n", "<leader>d", function()
  vim.diagnostic.open_float(nil, { scope = "line" })
end, { desc = "Open diagnostic float" })
