vim.g.mapleader = " "
vim.g.user_emmet_leader_key = "<C-Z>"

vim.g.user_emmet_update_tag = '<C-Z>u'

vim.g.user_emmet_next_key = '<C-n>'

local keymap = vim.keymap.set

keymap("n", "<leader>pv", vim.cmd.Ex)

keymap({ "i", "v" }, "uh", "<Esc>")

vim.cmd [[cnoreabbrev t2 set tabstop=2 softtabstop=2 shiftwidth=2]]
vim.cmd [[cnoreabbrev t4 set tabstop=4 softtabstop=4 shiftwidth=4]]
vim.cmd [[cnoreabbrev t8 set tabstop=8 softtabstop=8 shiftwidth=8]]

vim.cmd [[map H ^]]
vim.cmd [[map L $]]

keymap("i", "<C-n>", "<C-o>", { remap = true })

keymap("n", "J", "mzJ`z")
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>:", ":lua ")

keymap("n", "dc", "cc<Esc>")

keymap("n", "<leader>;", "A;<Esc>")

keymap("n", "<leader>w", "<cmd>w<CR>")
keymap("n", "<leader>W", "<cmd>w!<CR>")
keymap("n", "<leader>q", "<cmd>q<CR>")
keymap("n", "<leader>Q", "<cmd>q!<CR>")

keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

--buffer utils

keymap("n", "<leader>bq", "<cmd>bd<CR>")
keymap("n", "<leader>bQ", "<cmd>bd!<CR>")

keymap("n", "<leader>bn", "<cmd>bn<CR>")
keymap("n", "<leader>bp", "<cmd>bp<CR>")

keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])


keymap({ "n", "v" }, "<leader>p", [["+p]])
keymap("n", "<leader>P", [["+P]])

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

keymap("n", "<leader>tn", "<cmd>tabnext<CR>")
keymap("n", "<leader>tp", "<cmd>tabprevious<CR>")

-- surround

-- Format string with one %s to insert the current line into that pos
-- one %s because the it will be called with string.format

local function escape(s)
  return (s:gsub('[%-%.%+%[%]%(%)%$%^%%%?%*]', '%%%1'))
end

Surrounds = {
  ["js"] = "console.log(%s);",
  ["cpp"] = "std::cout << %s;",
  ["lua"] = "print(vim.inspect(%s))",
}

function SurroundDbg(file)
  local filetype = file:match(".*%.([^%.]*)")
  local line = string.trim(vim.api.nvim_get_current_line())

  local surround = escape(Surrounds[filetype])
  local regex = string.gsub(surround, "%%%%s", "(.*)")
  local match = string.match(line, regex)

  local content = match or string.format(Surrounds[filetype], string.trim(line))
  print(vim.inspect(regex))
  vim.fn.setline(vim.fn.getpos(".")[2], content)
  vim.api.nvim_feedkeys("==", "n", true)
end

keymap("n", "<leader>db", "<cmd>lua SurroundDbg(vim.fn.expand('%'))<CR>")
