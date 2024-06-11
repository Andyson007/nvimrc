return {
	"xiyaowong/transparent.nvim",
	config = function()
		vim.g.transparent_groups = vim.list_extend(vim.g.transparent_groups or {}, {

			"TelescopePreviewNormal",
			"TelescopePreviewBorder",
			"TelescopePromptNormal",
			"TelescopePromptBorder",
			"TelescopePromptPrefix",
			"TelescopeResultsNormal",
			"TelescopeResultsBorder",
			"TelescopeTitle",
		})
	end,
}
