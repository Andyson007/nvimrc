vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("set")
require("remap")
require("autocmds")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{ "tpope/vim-sleuth" }, -- Detect tabstop and shiftwidth automatically
	{ "numToStr/Comment.nvim", opts = {} },

	-- Here is a more advanced example where we pass configuration
	-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
	--    require('gitsigns').setup({ ... })
	--
	-- See `:help gitsigns` to understand what the configuration keys do
	{ -- Adds git related signs to the gutter, as well as utilities for managing changes
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "┆" },
			},
		},
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function()
			require("which-key").setup()

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
				["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
				["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
			})
			require("which-key").register({
				["<leader>h"] = { "Git [H]unk" },
			}, { mode = "v" })
		end,
	},

	{ import = "plugins.telescope" },
	{ import = "plugins.lsp-config" },
	{ import = "plugins.nvim-cmp" },
	{ import = "plugins.nightly" },
	{ import = "plugins.lualine" },
	{ import = "plugins.conform" },
	{ import = "plugins.dap" },
	{ import = "plugins.treesitter" },
	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			-- Improves i/a movements as in w[i]p w[a]p
			require("mini.ai").setup({ n_lines = 500 })
		end,
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}, {})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
