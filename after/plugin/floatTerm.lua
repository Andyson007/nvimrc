vim.cmd[[let g:floaterm_width=0.99]]


vim.keymap.set({ "n", "t" }, "<M-t>", "<cmd>FloatermToggle<CR>")
vim.keymap.set("t", "<M-n>", "<cmd>FloatermNext<CR>")
vim.keymap.set("t", "<M-p>", "<cmd>FloatermPrev<CR>")


vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.rs" },
  callback = function()
    vim.keymap.set("n", "<leader>r", "<cmd>FloatermSend cargo run<CR><cmd>FloatermToggle<CR>")
  end
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.js" },
  callback = function()
    vim.keymap.set("n", "<leader>r", "<cmd>FloatermSend node %<CR><cmd>FloatermToggle<CR>")
  end
})
