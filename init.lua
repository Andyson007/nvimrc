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
	{ "tpope/vim-sleuth" },
	{ "numToStr/Comment.nvim", opts = {} },

	{
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		config = function()
			require("which-key").setup({
				triggers_blacklist = {
					-- list of mode / prefixes that should never be hooked by WhichKey
					-- this is mostly relevant for keymaps that start with a native binding
					i = { "i" },
					v = { "i" },
				},
			})

			-- Document existing key chains
			require("which-key").register({
				["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
				["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
				["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
				["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
				["<leader>t"] = { name = "[T]oggle", _ = "which_key_ignore" },
				["<leader>h"] = { name = "Git [H]unk", _ = "which_key_ignore" },
			})

			require("which-key").register({
				["<leader>h"] = { "Git [H]unk" },
			}, { mode = "v" })
		end,
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function(_, opts)
			require("oil").setup(opts)
			vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>")
		end,
	},

	{ import = "plugins.gitsigns" },
	{ import = "plugins.telescope" },
	{ import = "plugins.lsp.lsp-config" },
	{ import = "plugins.lsp.nvim-cmp" },
	{ import = "plugins.lsp.rust-tools" },
	{ import = "plugins.nightly" },
	{ import = "plugins.lualine" },
	{ import = "plugins.conform" },
	{ import = "plugins.dap" },
	{ import = "plugins.treesitter" },
	{ import = "plugins.trouble" },
	{ import = "plugins.obsidian" },

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
	{
		"saecki/crates.nvim",
		tag = "stable",
		config = function()
			require("crates").setup()
			local crates = require("crates")
			vim.keymap.set("n", "<leader>ct", crates.toggle, { desc = "[C]rates [T]oggle virtual text" })
			vim.keymap.set("n", "<leader>cr", crates.reload, { desc = "[C]rates [R]load" })

			vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "[C]rates [V]ersions" })
			vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "[C]rates show [F]eatures" })
			vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = "[C]rates show [D]ependencies" })

			vim.keymap.set(
				{ "n", "v" },
				"<leader>cu",
				crates.update_crate,
				{ desc = "[C]rates [u]pdate (includes major versions) 1.1 -> 1.9" }
			)
			vim.keymap.set(
				{ "n", "v" },
				"<leader>cU",
				crates.upgrade_crate,
				{ desc = "[C]rates [u]pgrade (ignores major versions) 1.1 -> 2.0" }
			)
		end,
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
	},
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				markdown = { "vale" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
				end,
			})
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		opts = {
			css = { rgb_fn = true }, -- Enable parsing rgb(...) functions in css.
			html = { names = true }, -- Disable parsing "names" like Blue or Gray
		},
	},
	{
		"folke/flash.nvim",
		event = "VeryLazy",
		---@type Flash.Config
		opts = {},
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
	{
		"windwp/nvim-ts-autotag",
		event = { "InsertEnter" },
		opts = {},
	},
	{
		"mattn/emmet-vim",
		event = "InsertEnter",
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "VeryLazy",
		opts = {},
		config = function(_, opts)
			require("lsp_signature").setup(opts)
		end,
		{
			"SmiteshP/nvim-navic",
			config = function()
				vim.o.statusline = "%{%v:lua.require'nvim-navic'.get_location()%}"
			end,
		},
	},
}, {})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
