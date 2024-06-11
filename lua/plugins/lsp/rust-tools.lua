return {
	"simrat39/rust-tools.nvim",
	config = function()
		local rt = require("rust-tools")

		rt.setup({
			server = {
				on_attach = function(_, bufnr)
					-- Hover actions
					vim.keymap.set("n", "<leader>db", rt.hover_actions.hover_actions, { buffer = bufnr })
					-- Code action groups
					vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
				end,
			},
		})
	end,
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
}
