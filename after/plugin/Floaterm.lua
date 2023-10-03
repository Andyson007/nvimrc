vim.keymap.set({ "n", "t" }, "<M-t>", "<cmd>FloatermToggle<CR>")
-- {pattern = {"*.rs","lua"}, command = [[nmap <leader>r <cmd>FloatermSend cargo run<CR><cmd>FloatermToggle<CR>]]}
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.rs"},
  callback = function ()
    vim.keymap.set("n", "<S-R>", "<cmd>FloatermSend cargo run<CR><cmd>FloatermToggle<CR>")
  end
})
