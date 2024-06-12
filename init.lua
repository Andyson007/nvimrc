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
	-- { "tpope/vim-sleuth" },
	{ import = "plugins.lsp" },
	{ import = "plugins.styling" },
	{ import = "plugins.utils" },
	{ import = "plugins.external.obsidian" },
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
    "pixelastic/vim-undodir-tree"
  }
}, {})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
