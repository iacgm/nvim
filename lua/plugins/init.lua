return {
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = function()
			return require "config.mason"
		end,
	},
	{ "folke/lazydev.nvim", opts = {} },
	{
		"mason-org/mason-lspconfig.nvim",
	},
	{
		"neovim/nvim-lspconfig",
		opts = {
			ui = {
				windows = {
					default_options = {
						border = "rounded",
					},
				},
			},
			inlay_hints = {
				enabled = true,
			},
		},
		config = function()
			require "config.lsp"
		end
	},
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' },
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"BurntSushi/ripgrep",
			"nvim-lua/plenary.nvim",
			'nvim-telescope/telescope-ui-select.nvim',
			"nvim-treesitter/nvim-treesitter",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
		},
		cmd = "Telescope",
		opts = function()
			return require "config.telescope"
		end,
		config = function(_, opts)
			require("telescope").setup(opts)
			require("telescope").load_extension("fzf")
		end
	},
	{
		'saecki/crates.nvim',
		ft = { 'toml' },
		config = function()
			require('crates').setup {
				completion = {
					cmp = {
						enabled = true,
					},
				},
			}
			require('cmp').setup.buffer {
				sources = { { name = 'crates' } },
			}
		end,
	},
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'neovim/nvim-lspconfig',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-buffer',
			'L3MON4D3/LuaSnip',
		},
		config = function()
			require "config.cmp"
		end
	},
	{
		'chentoast/marks.nvim',
		event = 'VeryLazy',
		opts = {},
	},
	{
		'nvim-treesitter/nvim-treesitter-context',
		dependencies = { 'nvim-treesitter/nvim-treesitter' },
		config = function()
			require('treesitter-context').setup {
				enable = true,        -- Enable this plugin (Can be enabled/disabled later via commands)
				multiwindow = false,  -- Enable multiwindow support.
				max_lines = 0,        -- How many lines the window should span. Values <= 0 mean no limit.
				min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
				line_numbers = true,
				multiline_threshold = 20, -- Maximum number of lines to show for a single context
				trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
				mode = 'cursor',      -- Line used to calculate context. Choices: 'cursor', 'topline'
				-- Separator between context and content. Should be a single character string, like '-'.
				-- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
				separator = '-',
				zindex = 20, -- The Z-index of the context window
				on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
			}
		end,
	},
	{
		'kylechui/nvim-surround',
		version = '*', -- Use for stability; omit to use `main` branch for the latest features
		event = 'VeryLazy',
		config = function()
			require('nvim-surround').setup {
				-- Configuration here, or leave empty to use defaults
			}
		end,
	},
	{
		'chrisgrieser/nvim-lsp-endhints',
		event = 'LspAttach',
	},
	{
		'tpope/vim-repeat',
	},
	{
		'ggandor/leap.nvim',
		lazy = false,
		opts = {
			case_sensitive = true,
		},
	},
	{
		'lowitea/aw-watcher.nvim',
		opts = {
			host = '127.0.0.1',
			port = 5600,
		},
	},
	{
		'LintaoAmons/cd-project.nvim',
		lazy = false,
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("cd-project").setup({
				projects_picker = "telescope",
				hooks = {
					{
						callback = function(_)
							-- Run init file, if it exists
							pcall(dofile, "init.lua")
							---@diagnostic disable-next-line: undefined-field
							-- vim.cmd("silent cd " .. vim.uv.cwd()) -- Otherwise, Cd-Project doesn't use local name on original file
						end,
					}
				}
			})
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},
	{
		'EdenEast/nightfox.nvim',
	},
	{
		"voldikss/vim-floaterm",
		config = function()
			require "config.floaterm"
		end
	},
	{
		"windwp/nvim-autopairs",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- setup cmp for autopairs
			local cmp_autopairs = require "nvim-autopairs.completion.cmp"
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
  {
    'ThePrimeagen/harpoon',
    branch = "harpoon2",
    requires = {{"nvim-lua/plenary.nvim"}}
  },
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			numhl = true,
			current_line_blame = true,
			current_line_blame_opts = {
				delay = 0,
				virt_text_pos = 'right_align',
				virt_text_priority = 1000,
			}
		}
	},
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-fugitive" },
	{ "iacgm/cargo-docview" },
	{
		"iacgm/docview",
		opts = {
			filetypes = {
				rs = "cargo-docview"
			}
		}
	},
}
