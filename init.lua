require('config.options')
require('config.keybinds')
require('config.lazy')
require('config.lsp')

vim.g.have_nerd_font = true

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- vim.diagnostic.config {
-- 	severity_sort = true,
-- 	terminal_colors = true,
-- 	float = { border = 'rounded', source = 'if_many' },
-- 	underline = { severity = vim.diagnostic.severity.ERROR },
-- 	signs = vim.g.have_nerd_font and {
-- 		text = {
-- 			[vim.diagnostic.severity.ERROR] = '󰅚 ',
-- 			[vim.diagnostic.severity.WARN] = '󰀪 ',
-- 			[vim.diagnostic.severity.INFO] = '󰋽 ',
-- 			[vim.diagnostic.severity.HINT] = '󰌶 ',
-- 		},
-- 	} or {},
-- 	virtual_text = {
-- 		source = 'if_many',
-- 		spacing = 2,
-- 		format = function(diagnostic)
-- 			local diagnostic_message = {
-- 				[vim.diagnostic.severity.ERROR] = diagnostic.message,
-- 				[vim.diagnostic.severity.WARN] = diagnostic.message,
-- 				[vim.diagnostic.severity.INFO] = diagnostic.message,
-- 				[vim.diagnostic.severity.HINT] = diagnostic.message,
-- 			}
-- 			return diagnostic_message[diagnostic.severity]
-- 		end,
-- 	},
-- }

-- Lualine setup
require('lualine').setup {
    options = {
        theme = 'auto', -- Automatically adapt to your current colorscheme
        globalstatus = true,
        component_separators = '',
        section_separators = '',
        disabled_filetypes = { 'NvimTree', 'lazy', 'mason', 'dashboard' },
    },

    sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1, 1) end } }, -- Show only first letter (N, I, V, etc.)
        lualine_b = { 'branch' },
        lualine_c = {
            { 'filename', path = 1, symbols = { modified = '●', readonly = '' } }, -- Relative path, clean icons
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { { 'location', icon = '' } },
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { 'filename', path = 1 } },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
    },

    extensions = { 'fugitive', 'lazy', 'mason', 'nvim-tree' },
}
