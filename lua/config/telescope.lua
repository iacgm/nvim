local actions = require "telescope.actions"
return {
	defaults = {
		path_display = {
			"filename_first",
			"smart",
		},
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				width = 0.9,
				preview_width = 0.6,
			},
			vertical = {
				width = 0.9,
			}
		},
		mappings = {
			n = {
				["q"] = actions.close,
				["<C-l>"] = actions.cycle_previewers_next,
				["<C-h>"] = actions.cycle_previewers_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
			i = {
				["<C-l>"] = actions.cycle_previewers_next,
				["<C-h>"] = actions.cycle_previewers_prev,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			}
		},
	},

	extensions_list = { "fzf", "themes", "terms" },
	extensions = {},
}
