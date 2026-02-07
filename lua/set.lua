vim.g.have_nerd_font = true
vim.g.user_emmet_leader_key = '<C-Z>'

local opt = vim.opt

vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

opt.mouse = "a"
vim.opt.showmode = false

vim.opt.breakindent = true

opt.cmdheight = 1

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.softtabstop = 2
opt.shiftwidth = 2
opt.expandtab = true

opt.smartindent = true

opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undofile = true

vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 4
opt.signcolumn = "yes"
opt.isfname:append("@-@")

vim.g.netrw_banner = 0;

opt.updatetime = 100

opt.colorcolumn = "80"

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300

vim.opt.splitright = true
vim.opt.splitbelow = true

-- live :%s/ in split window
vim.opt.inccommand = "split"

vim.opt.cursorline = true

opt.undodir = "/tmp/undo"

vim.filetype.add({
  extension = {
    ktane = 'ktane',
  },
})

