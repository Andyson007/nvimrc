return { -- Fuzzy Finder (files, lsp, etc)
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ -- If encountering errors, see telescope-fzf-native README for installation instructions
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",

			-- `cond` is a condition used to determine whether this plugin should be
			-- installed and loaded.
			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		-- Useful for getting pretty icons, but requires a Nerd Font.
		{ "nvim-tree/nvim-web-devicons" },
	},
	config = function()
		require("telescope").setup({
			-- defaults = {
			--   mappings = {
			--     i = { ['<c-enter>'] = 'to_fuzzy_refine' },
			--   },
			-- },
			-- pickers = {}
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})

		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "ui-select")
		pcall(require("telescope").load_extension, "frecency")

		local builtin = require("telescope.builtin")

		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
					-- the default case_mode is "smart_case"
				},
			},
		})

		vim.keymap.set("n", "<leader>bb", builtin.builtin, { desc = "View all avaiable Telescope command" })
		vim.keymap.set("n", "<leader>tt", builtin.treesitter, { desc = "Treesitter Symbols e.g. variables " })
		vim.keymap.set("n", "<leader>pr", builtin.resume, { desc = "Resume previous search" })
		vim.keymap.set("n", "<leader>he", builtin.help_tags, { desc = "[He]lp" })
		vim.keymap.set("n", "<leader>gi", builtin.lsp_implementations, { desc = "[G]o to [i]mplementation under cursor. If multiple show in Telescope men" })
		vim.keymap.set("n", "<leader>gr", builtin.lsp_references, { desc = "Show all references to this variable/function" })
		vim.keymap.set("n", "<leader>gD", builtin.lsp_definitions, { desc = "Show all definitions of this variable/function" })
		vim.keymap.set("n", "<leader>gty", builtin.lsp_type_definitions, { desc = "[G]o to [ty]pe definitions" })
		vim.keymap.set("n", "<leader>pd", builtin.lsp_document_symbols, { desc = "[P]roject [D]ocument symbols" })
		vim.keymap.set("n", "<leader>dl", builtin.diagnostics, { desc = "[D]iagnostic [L]ist" })
		vim.keymap.set("n", "<leader>p:", builtin.command_history, { desc = "Command history" })
		vim.keymap.set("n", "<leader>p/", builtin.search_history, { desc = "Search history" })
		vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "[P]roject [B]uffers" })
		vim.keymap.set("n", "<leader>po", builtin.oldfiles, { desc = "" })
		vim.keymap.set("n", "<leader>vi", builtin.vim_options, { desc = "[VI]m options" })
		vim.keymap.set("n", "<leader>gp", builtin.git_files, { desc = "All files in the current git repo" })
		vim.keymap.set("n", "<leader>pp", builtin.jumplist, { desc = "jumplist" })
		vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "[P]roject [F]iles" })
		vim.keymap.set("n", "<leader>gb", builtin.git_branches, { desc = "[G]it [B]ranches" })
		vim.keymap.set("n", "<leader>gc", builtin.git_commits, { desc = "[G]it [C]ommits" })
		vim.keymap.set("n", "<leader>gs", builtin.git_status, { desc = "[G]it [S]tatus (Shows all buffers and their status)" })
		vim.keymap.set("n", "<leader>gt", builtin.git_stash, { desc = "[G]it s[T]ashe" })
		vim.keymap.set("n", "<leader>pg", builtin.live_grep, { desc = "[P]roject [G]rep" })
		vim.keymap.set("n", "<leader>ps", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, {desc = "[P]roject [S]earch"})

		vim.keymap.set("n", "<leader><leader>pf", "<Cmd>Telescope frecency<cr>")

		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		vim.keymap.set("n", "<leader>s/", function()
			builtin.live_grep({
				grep_open_files = true,
				prompt_title = "Live Grep in Open Files",
			})
		end, { desc = "[S]earch [/] in Open Files" })

		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}
