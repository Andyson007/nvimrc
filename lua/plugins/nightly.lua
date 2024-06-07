return {
	"Alexis12119/nightly.nvim",
	priority = 1000,
	init = function()
		vim.cmd("colorscheme nightly")
	end,
	config = function()
		require("nightly").setup({
			transparent = true,
			styles = {
				comments = { italic = false },
				functions = { italic = true },
				variables = { italic = false },
				keywords = { italic = true },
			},
		})
	end,
}
