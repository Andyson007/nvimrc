require("nightly").setup({
  transparent = false,
  styles = {
    comments = { italic = false },
    functions = { italic = false },
    variables = { italic = false },
    keywords = { italic = false },
  },
  highlights = {},
})

vim.cmd [[colorscheme nightly]]
