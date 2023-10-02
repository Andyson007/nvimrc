vim.g.mapleader = " "
vim.g.user_emmet_leader_key = "<C-Z>"

vim.g.user_emmet_update_tag = '<C-Z>u'

vim.g.user_emmet_next_key = '<C-n>'

local keymap = vim.keymap.set

keymap("n", "<leader>pv", vim.cmd.Ex)

keymap({ "i", "v" }, "uh", "<Esc>")

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>W", ":wall<CR>")
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>Q", ":q!<CR>")
keymap("n", "<leader>r", ":so<CR>")

keymap("n", "<M-h>", "<C-w>h")
keymap("n", "<M-j>", "<C-w>j")
keymap("n", "<M-k>", "<C-w>k")
keymap("n", "<M-l>", "<C-w>l")

--buffer utils

keymap("n", "<leader>bq", ":bd<CR>")
keymap("n", "<leader>bQ", ":bd!<CR>")

keymap("n", "<leader>bn", ":bn<CR>")
keymap("n", "<leader>bp", ":bp<CR>")

keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])


keymap({ "n", "v" }, "<leader>p", [["+p]])
keymap("n", "<leader>P", [["+P]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

keymap("n", "Q", "<nop>")
keymap("n", "<leader>f", vim.lsp.buf.format)

keymap("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap("n", "<C-j>", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

-- keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
keymap("n", "<leader>ml", "<cmd>CellularAutomaton game_of_life<CR>");
keymap("n", "<leader>ms", "<cmd>CellularAutomaton scramble<CR>");

keymap("n", "<S-F5>", "<cmd>CompilerOpen<CR>")
keymap("n", "<F5>", "<cmd>CompilerRedo<CR>")
keymap("n", "<F6>", "<cmd>!node .<CR>")

keymap("n", "<leader>d<leader>", "<cmd>DiffviewOpen<CR>")
keymap("n", "<leader>dq", "<cmd>DiffviewClose<CR>")
keymap("n", "<leader>dc", "<cmd>DiffviewFileHistory<CR>")


keymap("n", "<leader>l", "<cmd>Lazy<CR>")
keymap("n", "<leader>m", "<cmd>Mason<CR>")
