return {
  'Julian/lean.nvim',
  event = { 'BufReadPre *.lean', 'BufNewFile *.lean' },

  dependencies = {
    'neovim/nvim-lspconfig',
    'nvim-lua/plenary.nvim',
    'andrewradev/switch.vim',
    -- you also will likely want nvim-cmp or some completion engine
  },

  -- see details below for full configuration options
  opts = {
    lsp = {},
    mappings = true,
  }
}
