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
	{ "tpope/vim-vinegar" },
	{ import = "plugins.lsp" },
	{ import = "plugins.styling" },
	{ import = "plugins.utils" },
	{ import = "plugins.external.obsidian" },
	{ import = "plugins.external.markdown" },
  {
    "pixelastic/vim-undodir-tree"
  }
}, {})
-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et

if vim.g.neovide then
  require("neovide")
end
