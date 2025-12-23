vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf, remap = false }

		vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set('n', 'gr', "grr", opts)
		vim.keymap.set('n', '<C-r>', "grn", opts)
		vim.keymap.set('n', '<leader>a', "gra", opts)
		vim.keymap.set('n', '<C-F>', function() vim.lsp.buf.format({ async = true }) end)
		vim.keymap.set('n', '[d', function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set('n', ']d', function() vim.diagnostic.goto_next() end, opts)
		-- Display diagnostic or additional info
		vim.keymap.set('n', 'K', function()
			if not vim.diagnostic.open_float() then
				vim.lsp.buf.hover()
			end
		end, opts)
		vim.keymap.set('n', '<leader>K', function() vim.lsp.buf.hover() end, opts)
	end,
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup({})
require('mason-lspconfig').setup({
	ensure_installed = {
		'rust_analyzer'
	},
	handlers = {
		function(server_name)
			require('lspconfig')[server_name].setup({
				capabilities = lsp_capabilities,
			})
		end,
		lua_ls = function()
			require('lspconfig').lua_ls.setup({
				capabilities = lsp_capabilities,
				settings = {
					Lua = {
						runtime = {
							version = 'LuaJIT'
						},
						diagnostics = {
							globals = { 'vim' },
						},
						workspace = {
							library = {
								vim.env.VIMRUNTIME,
							}
						}
					}
				}
			})
		end,
	}
})

vim.diagnostic.config({
	virtual_text = true,
})
