vim.g.mapleader = " "
vim.g.user_emmet_leader_key = "<C-Z>"

vim.g.user_emmet_update_tag = '<C-Z>u'

vim.g.user_emmet_next_key = '<C-n>'

local keymap = vim.keymap.set

keymap("n", "<leader>pv", vim.cmd.Ex)

keymap({ "i", "v" }, "uh", "<Esc>")

vim.cmd [[map H ^]]

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

keymap("i", "<C-n>", "<C-o>", { remap = true })

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>w", ":w<CR>")
keymap("n", "<leader>W", ":wall<CR>")
keymap("n", "<leader>q", ":q<CR>")
keymap("n", "<leader>Q", ":q!<CR>")

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.lua"},
  callback = function ()
    vim.keymap.set("n", "<leader>r", "<cmd>so<cr>")
  end
})
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

keymap("n", "<S-F5>", "<cmd>CompilerOpen<CR>")
keymap("n", "<F5>", "<cmd>CompilerRedo<CR>")
keymap("n", "<F6>", "<cmd>!node .<CR>")

keymap("n", "<leader>d<leader>", "<cmd>DiffviewOpen<CR>")
keymap("n", "<leader>dq", "<cmd>DiffviewClose<CR>")
keymap("n", "<leader>dc", "<cmd>DiffviewFileHistory<CR>")

--quickfix
keymap("n", "<leader>cn", "<cmd>silent cnext<CR>")
keymap("n", "<leader>cp", "<cmd>silent cprevious<CR>")
keymap("n", "<leader>e", function()
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      vim.cmd "cclose"
      return;
    end
  end
  vim.cmd "copen"
end)


-- BS
keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");
keymap("n", "<leader>ml", "<cmd>CellularAutomaton game_of_life<CR>");
keymap("n", "<leader>ms", "<cmd>CellularAutomaton scramble<CR>");
-- Self descriptive
keymap("n", "<leader>l", "<cmd>Lazy<CR>")
keymap("n", "<leader>m", "<cmd>Mason<CR>")



--vim.keymap.set('n', '<leader>ct', crates.toggle)
--vim.keymap.set('n', '<leader>cr', crates.reload)
