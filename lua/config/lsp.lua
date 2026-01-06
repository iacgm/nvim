vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('user_lsp_attach', { clear = true }),
	callback = function(event)
		local opts = { buffer = event.buf, remap = false }

		vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
		vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, opts)
		vim.keymap.set('n', '<C-F>', function() vim.lsp.buf.format({ async = true }) end)
		vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
		vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
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
			---@diagnostic disable-next-line: undefined-field
			vim.lsp.config[server_name] = {
				capabilities = lsp_capabilities,
			}
      vim.lsp.enable(server_name)
		end,
		lua_ls = function()
			vim.lsp.config.lua_ls = {
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
			}
		end,
	}
})

vim.diagnostic.config({
	virtual_text = true,
})
