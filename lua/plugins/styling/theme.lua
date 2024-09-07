return {
  'Everblush/nvim',
  name = "eveblush",
  priority = 1000,
  init = function()
    vim.cmd("colorscheme everblush")
  end,
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
  end,
}

