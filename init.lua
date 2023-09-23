local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = ' ' -- Make sure to set `mapleader` before lazy so your mappings are correct
require('Andreas')

require('lazy').setup({
  {
    'nvim-lua/plenary.nvim'
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-treesitter/playground' },
  { 'theprimeagen/harpoon' },
  { 'tpope/vim-fugitive' },
  { 'sindrets/diffview.nvim' },
  { 'tpope/vim-surround' },
  { '/lewis6991/gitsigns.nvim' },
  {
    'luckasRanarison/nvim-devdocs',
    dependecies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-treesitter/nvim-treesitter',
    },
    opts = {
      previewer_cmd = 'glow',
      cmd_args = { '-s', 'dark', '-w', '80' }
    }
  },
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },
      {
        'L3MON4D3/LuaSnip',
        -- follow latest release.
        version = '2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = 'make install_jsregexp',
        dependencies = {
          'rafamadriz/friendly-snippets',
          dependencies = {
            'saadparwaiz1/cmp_luasnip'
          }
        },
      }
    }
  },
  {
    'windwp/nvim-ts-autotag',
    opts = {}
  },
  { 'mattn/emmet-vim' },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {} -- this is equalent to setup({}) function
  },
  { 'norcalli/nvim-colorizer.lua' },
  {
    'numToStr/Comment.nvim',
    opts = {
      -- add any options here
    },
    lazy = false,
  },
  { 'lukas-reineke/indent-blankline.nvim' },
  { 'Alexis12119/nightly.nvim' },
  { 'eandrju/cellular-automaton.nvim' },
  { 'xiyaowong/transparent.nvim' },
  {
    'nvim-treesitter/nvim-treesitter-textobjects',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    },
  },
  { 'voldikss/vim-floaterm' },
  { 'nvim-tree/nvim-web-devicons' },
  {
    'folke/flash.nvim',
    event = 'VeryLazy',
    ---@type Flash.Config
    opts = {},
    -- stylua: ignore
    keys = {
      { 'S', mode = { 'n', 'o', 'x' }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      {
        'R',
        mode = { 'o', 'x' },
        function() require('flash').treesitter_search() end,
        desc = 'Treesitter Search'
      },
    },
  },
  { 'ggandor/leap.nvim' },
  {
    'rasulomaroff/telepath.nvim',
    dependencies = 'ggandor/leap.nvim',
    -- there's no sence in using lazy loading since telepath won't load the main module
    -- until you actually use mappings
    lazy = false,
    config = function()
      require('telepath').use_default_mappings()
    end
  },
  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',         -- required
      'nvim-telescope/telescope.nvim', -- optional
      'sindrets/diffview.nvim',        -- optional
      'ibhagwan/fzf-lua',              -- optional
    },
    config = true
  },
})
