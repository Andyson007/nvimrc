return {
  "Shatur/neovim-ayu",
  name = "ayu",
  priority = 1000,
  config = function()
    require("ayu").setup({
      transparent = true,
      terminal = true,
      styles = {
        comments = { italic = false },
        functions = { italic = true },
        variables = { italic = false },
        keywords = { italic = true },
      },
      overrides = {
        LineNrAbove = { fg = "lightgreen" },
        LineNr = { fg = "green" },
        LineNrBelow = { fg = "lightred" },
        ['@lit-indicator'] = { fg = 'green' },
        ['@unlit-indicator'] = { fg = 'red' },
        ['@batteries'] = { link = '@variable' },
        ['@holders'] = { link = '@variable' },
        ['@serial'] = { link = '@variable' },
        ['@module-name'] = { link = '@type' },
        ['@module-info'] = { link = '@constant' },
      }
    })
    vim.cmd("colorscheme ayu")
    vim.opt.cursorline = false
  end,
}
