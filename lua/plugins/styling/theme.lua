return {
  "Shatur/neovim-ayu",
  name = "ayu",
  priority = 1000,
  config = function()
    require("ayu").setup({
      transparent = true,
      styles = {
        comments = { italic = false },
        functions = { italic = true },
        variables = { italic = false },
        keywords = { italic = true },
      },
    })
    vim.cmd("colorscheme ayu")
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "lightgreen" })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = "green" })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "lightred" })
    vim.opt.cursorline = false
  end,
}
