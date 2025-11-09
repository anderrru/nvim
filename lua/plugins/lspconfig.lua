return {
    {
	'neovim/nvim-lspconfig',
	dependencies = { 'saghen/blink.cmp' },

	-- example using `opts` for defining servers
	opts = {
	    servers = {
		lua_ls = {}
	    }
	},
	config = function(_, opts)
	    for server, config in pairs(opts.servers) do
		-- passing config.capabilities to blink.cmp merges with the capabilities in your
		-- `opts[server].capabilities, if you've defined it
		config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
		vim.lsp.config[server] = vim.tbl_deep_extend(
		    'force',
		    vim.lsp.config[server] or {},
		    config
		)

		-- Enable the LSP server for its filetypes
		vim.lsp.enable(server)
	    end
	end
    }
}
