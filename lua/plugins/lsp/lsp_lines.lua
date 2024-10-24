return {
  "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  config = function()
    require("lsp_lines").setup()
    require("lsp_lines").toggle()
    vim.keymap.set("n", "<leader>tl", require("lsp_lines").toggle, { desc = "[t]oggle [l]sp_lines" })
  end
}
