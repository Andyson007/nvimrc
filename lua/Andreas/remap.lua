
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.g.user_emmet_leader_key = "<C-Z>"

vim.g.user_emmet_update_tag = '<C-Z>u'

vim.g.user_emmet_next_key = '<C-n>'

vim.keymap.set({"i", "v"}, "uh", "<Esc>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>W", ":w!<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":q!<CR>")
vim.keymap.set("n", "<leader>r", ":so<CR>")

vim.keymap.set("n", "<S-h>", "<C-w>h")
vim.keymap.set("n", "<S-j>", "<C-w>j")
vim.keymap.set("n", "<S-k>", "<C-w>k")
vim.keymap.set("n", "<S-l>", "<C-w>l")

vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-l>", "<Right>")

--buffer utils

vim.keymap.set("n", "<leader>bq", ":bd<CR>")
vim.keymap.set("n", "<leader>bQ", ":bd!<CR>")

vim.keymap.set("n", "<leader>bn", ":bn<CR>")
vim.keymap.set("n", "<leader>bp", ":bp<CR>")

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])


vim.keymap.set({"n", "v"}, "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
vim.keymap.set("n", "<leader>ml", "<cmd>CellularAutomaton game_of_life<CR>");
vim.keymap.set("n", "<leader>ms", "<cmd>CellularAutomaton scramble<CR>");

vim.keymap.set("n", "<S-F5>","<cmd>CompilerOpen<CR>")
vim.keymap.set("n", "<F5>","<cmd>CompilerRedo<CR>")
vim.keymap.set("n", "<F6>","<cmd>!node .<CR>")

vim.keymap.set("n", "<leader>d<leader>","<cmd>DiffviewOpen<CR>")
vim.keymap.set("n", "<leader>dq","<cmd>DiffviewClose<CR>")
vim.keymap.set("n", "<leader>dc","<cmd>DiffviewFileHistory<CR>")
