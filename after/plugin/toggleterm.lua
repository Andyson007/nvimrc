require 'toggleterm'.setup {
  shade_terminals = false
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  cmd = "lazygit",
  dir = "git_dir",
  count=1,
  direction = "float",
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

lazygit:spawn()

vim.api.nvim_set_keymap("n", "<M-l>", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true, silent = true })

function _G.set_terminal_keymaps()
  local opts = { buffer = 0 }
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

vim.keymap.set({ "n", "t" }, "<M-t>", "<cmd>1ToggleTerm<CR>")

-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = { "*.rs" },
--   callback = function()
--     vim.keymap.set("n", "<leader>r", "<cmd>FloatermSend cargo run<CR><cmd>FloatermToggle<CR>")
--   end
-- })
--
-- vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
--   pattern = { "*.js" },
--   callback = function()
--     vim.keymap.set("n", "<leader>r", "<cmd>FloatermSend node %<CR><cmd>FloatermToggle<CR>")
--   end
-- })
--
-- vim.cmd[[FloatermNew --wintype=split --height=0.3 --name=init]]
-- vim.cmd[[FloatermToggle init]]
-- vim.cmd[[stopinsert]]
