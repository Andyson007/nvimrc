local opt = vim.opt

opt.cmdheight = 1

opt.nu = true
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

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.scrolloff = 4
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 100

opt.colorcolumn = "80"

opt.lazyredraw = true

vim.cmd [[ let g:rust_recommended_style = v:false ]]
if vim.loop.os_uname().sysname == "Windows_NT" then
  opt.undodir = "C:/Users/Andy/temp/.vim/undodir"
  vim.cmd [[
		let &shell = executable('pwsh') ? 'pwsh' : 'powershell'
		let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'
		let &shellredir = '2>&1 | %%{ "$_" } | Out-File %s; exit $LastExitCode'
		let &shellpipe  = '2>&1 | %%{ "$_" } | Tee-Object %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]
else
  opt.undodir = "/tmp/undo"
end
opt.shadafile = "NONE"

vim.cmd [[ let g:netrw_list_hide = '^\.\.\?/$' ]]

vim.opt.conceallevel = 1
