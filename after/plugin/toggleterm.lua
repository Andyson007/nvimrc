require 'toggleterm'.setup {
  shade_terminals = false
}

local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
  hidden = true,
  count = 5,
  cmd = "lazygit",
  dir = "git_dir",
  direction = "float",
  -- function to run on opening the terminal
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", { noremap = true, silent = true })
  end,
})

function _lazygit_toggle()
  lazygit:toggle()
end

-- lazygit:spawn()

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

local togglemap = "<M-t>"
vim.keymap.set({ "n", "t" }, togglemap, "<cmd>ToggleTerm<CR>")

Compileopts = {
  ["rs"] = function(_) return "cargo run" end,
  ["py"] = function(file) return string.format("python3 %s", file) end,
  ["js"] = function(file) return string.format("node %s", file) end,
  ["cpp"] = function(file) return string.format("g++ %s;./a", file) end,
  ["tsx"] = function(file) return "npm run build" end,
  ["html"] = function(_) return "reload" end,
  ["css"] = function(_) return "reload" end,
}

function _Compile_toggle(file)
  local filetype = file:match(".*%.([^%.]*)")
  if (filetype == "lua") then
    vim.cmd [[so]]
    return;
  elseif (filetype == "txt") then
    vim.cmd [[e]]
    return;
  end
  Terminal:new({
    close_on_exit = false,
    count = 6,
    cmd = Compileopts[filetype](file),
    direction = "float",
    -- on_open = function(term)
    --   vim.api.nvim_buf_set_keymap(term.bufnr, "t", togglemap, "<cmd>q!<CR>", { noremap = true, silent = true })
    -- end,
  }):toggle()
end

vim.api.nvim_set_keymap("n", "<leader>r", "<cmd>lua _Compile_toggle(vim.fn.expand('%'))<CR>",
  { noremap = true, silent = true })
