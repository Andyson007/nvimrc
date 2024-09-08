return {
  "Everblush/nvim",
  name = "everblush",
  priority = 1000,
  config = function()
    require("everblush").setup({
      transparent = true,
      styles = {
        comments = { italic = false },
        functions = { italic = true },
        variables = { italic = false },
        keywords = { italic = true },
      },
    })
    vim.cmd("colorscheme everblush")
    vim.api.nvim_set_hl(0, 'LineNrAbove', { fg = "lightgreen" })
    vim.api.nvim_set_hl(0, 'LineNr', { fg = "green" })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { fg = "lightred" })
    vim.opt.cursorline = false
  end,
}
