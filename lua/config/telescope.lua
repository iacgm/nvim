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
        preview_width = 0.5,
      },
    },
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
    },
  },

  extensions_list = { "fzf", "themes", "terms" },
  extensions = {},
}
