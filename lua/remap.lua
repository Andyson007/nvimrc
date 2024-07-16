local keymap = vim.keymap.set

keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
keymap("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.g.user_emmet_update_tag = "<C-Z>u"

vim.g.user_emmet_next_key = "<C-n>"

-- Replaced with oil.nvim
keymap("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw" })

keymap({ "i", "v" }, "uh", "<Esc>", { desc = "Exit insert/visual mode" })

vim.cmd([[cnoreabbrev t2 set tabstop=2 softtabstop=2 shiftwidth=2]])
vim.cmd([[cnoreabbrev t4 set tabstop=4 softtabstop=4 shiftwidth=4]])
vim.cmd([[cnoreabbrev t8 set tabstop=8 softtabstop=8 shiftwidth=8]])

vim.cmd([[map H ^]])
vim.cmd([[map L $]])

keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")

keymap("n", "<leader>:", ":lua ")

keymap("n", "dc", "cc<Esc>")

keymap("n", "<leader>;", "A;<Esc>")

keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "soft save" })
keymap("n", "<leader>W", "<cmd>w!<CR>", { desc = "hard save" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "soft quit" })
keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "hard quit" })

keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

--buffer utils
keymap("n", "<leader>bq", "<cmd>bd<CR>", { desc = "close this buffer" })
keymap("n", "<leader>bQ", "<cmd>bd!<CR>", { desc = "force close the buffer" })

keymap("n", "<leader>bn", "<cmd>bn<CR>")
keymap("n", "<leader>bp", "<cmd>bp<CR>")

-- Clipboard stuff
keymap({ "n", "v" }, "<leader>y", [["*y]], { desc = "[Y]ank to system clipboard" })
keymap({ "n", "v" }, "<leader>Y", [["*Y]], { desc = "[Y]ank to system clipboard" })

keymap({ "n", "v" }, "<leader>p", [["*p]])
keymap({ "n", "v" }, "<leader>P", [["*P]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

keymap("n", "Q", "<nop>")

keymap("n", "<leader>cn", "<cmd>cnext<CR>zz")
keymap("n", "<leader>cp", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

--quickfix
keymap("n", "<leader>cn", "<cmd>silent cnext<CR>")
keymap("n", "<leader>cp", "<cmd>silent cprevious<CR>")
keymap("n", "<leader>e", function()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
end)

-- BS
keymap("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")
keymap("n", "<leader>ml", "<cmd>CellularAutomaton game_of_life<CR>")
keymap("n", "<leader>ms", "<cmd>CellularAutomaton scramble<CR>")

-- Self descriptive
keymap("n", "<leader>l", "<cmd>Lazy<CR>")
keymap("n", "<leader>m", "<cmd>Mason<CR>")

-- Tab utils
keymap("n", "<leader>tn", "<cmd>tabnext<CR>")
keymap("n", "<leader>tp", "<cmd>tabprevious<CR>")

-- Indentation
keymap("n", "<<leader>", "<<", {desc = "Indent left"})
keymap("n", "><leader>", ">>", {desc = "Indent right"})
