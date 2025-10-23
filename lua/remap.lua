local keymap = vim.keymap.set

keymap("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
keymap("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
keymap("n", "<leader>de", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
keymap("n", "<leader>dq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

keymap({ "i", "v" }, "uh", "<Esc>", { desc = "Exit insert/visual mode" })

vim.cmd([[cnoreabbrev t2 set tabstop=2 softtabstop=2 shiftwidth=2]])
vim.cmd([[cnoreabbrev t4 set tabstop=4 softtabstop=4 shiftwidth=4]])
vim.cmd([[cnoreabbrev t8 set tabstop=8 softtabstop=8 shiftwidth=8]])

-- scrolling
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzz")
keymap("n", "N", "Nzz")

-- quitting
keymap("n", "<leader>w", "<cmd>w<CR>", { desc = "soft save" })
keymap("n", "<leader>W", "<cmd>w!<CR>", { desc = "hard save" })
keymap("n", "<leader>q", "<cmd>q<CR>", { desc = "soft quit" })
keymap("n", "<leader>Q", "<cmd>q!<CR>", { desc = "hard quit" })

-- Window movement
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- buffer utils
keymap("n", "<leader>bq", "<cmd>bd<CR>", { desc = "close this buffer" })
keymap("n", "<leader>bQ", "<cmd>bd!<CR>", { desc = "force close the buffer" })

keymap("n", "<leader>bn", "<cmd>bn<CR>")
keymap("n", "<leader>bp", "<cmd>bp<CR>")

-- Deleting to void 
keymap({ "n", "v" }, "<leader>d", [["_d]])
keymap({ "n", "v" }, "<leader>c", [["_c]])

keymap("n", "<leader>cn", "<cmd>cnext<CR>zz")
keymap("n", "<leader>cp", "<cmd>cprev<CR>zz")
keymap("n", "<leader>k", "<cmd>lnext<CR>zz")
keymap("n", "<leader>j", "<cmd>lprev<CR>zz")

keymap("n", "<leader>e", function()
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			vim.cmd("cclose")
			return
		end
	end
	vim.cmd("copen")
end)

-- Self descriptive
keymap("n", "<leader>l", "<cmd>Lazy<CR>")
keymap("n", "<leader>;", "A;<Esc>")

-- Tab utils
keymap("n", "<leader>tn", "<cmd>tabnext<CR>")
keymap("n", "<leader>tp", "<cmd>tabprevious<CR>")

-- Indentation
keymap("n", "<<leader>", "<<", {desc = "Indent left"})
keymap("n", "><leader>", ">>", {desc = "Indent right"})
