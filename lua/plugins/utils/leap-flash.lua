return {
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		opts = {
			modes = {
				search = { enabled = true },
			},
		},
		---@type Flash.Config
		keys = {
			{
				"S",
				mode = { "n", "o" },
				function()
					require("flash").treesitter()
				end,
				desc = "Flash Treesitter",
			},
			{
				"R",
				mode = { "o", "x" },
				function()
					require("flash").treesitter_search({
						remote_op = {
							restore = true,
							motion = true,
						},
					})
				end,
				desc = "Treesitter Search",
			},
		},
	},
	{
		"rasulomaroff/telepath.nvim",
		dependencies = "ggandor/leap.nvim",
		-- there's no sence in using lazy loading since telepath won't load the main module
		-- until you actually use mappings
		lazy = false,
		config = function()
			require("telepath").use_default_mappings()
		end,
	},
	{
		"ggandor/leap.nvim",
		config = function()
			require("leap").add_default_mappings()
			vim.keymap.set("n", "s", function()
				local current_window = vim.fn.win_getid()
				require("leap").leap({ target_windows = { current_window } })
			end)
		end,
	},
}
