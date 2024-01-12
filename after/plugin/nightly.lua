require("nightly").setup({
  transparent = true,
  styles = {
    comments = { italic = false },
    functions = { italic = true },
    variables = { italic = false },
    keywords = { italic = true },
  },
  highlights = {},
})

vim.cmd [[colorscheme nightly]]
vim.cmd [[hi LineNr guifg=#2d3437]]
