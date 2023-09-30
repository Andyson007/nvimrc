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
-- TODO test
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
    event = "VeryLazy",
    dependencies = {
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
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
  { 'HiPhish/rainbow-delimiters.nvim' },
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
      { 'S', mode = { 'n', 'o', }, function() require('flash').treesitter() end, desc = 'Flash Treesitter' },
      {
        'R',
        mode = { 'o', 'x' },
        function()
          require('flash').treesitter_search({
            remote_op = {
              restore = true,
              motion = true,
            }
          })
        end,
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
    "NStefan002/speedtyper.nvim",
    cmd = "Speedtyper",
    opts = {}
  },
  { 'mbbill/undotree' },
  { 'harrisoncramer/jump-tag' },
  {
    "dstein64/vim-startuptime",
    -- lazy-load on a command
    cmd = "StartupTime",
    -- init is called during startup. Configuration for vim plugins typically should be set in an init function
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "kdheepak/lazygit.nvim",
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
  { 'AndrewRadev/switch.vim' },
  { 'monaqa/dial.nvim' },
  { "SmiteshP/nvim-navic" },
  {
    "SmiteshP/nvim-navbuddy",

    cmd = "Navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } }
  },
})
