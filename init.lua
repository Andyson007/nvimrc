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
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    dependencies = {
      'nvim-telescope/telescope-frecency.nvim',
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'make'
      }
    }
  },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-treesitter/playground' },
  { 'sindrets/diffview.nvim' },
  { 'tpope/vim-surround' },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      preview_config = {
        border = "none",
      },
    },
  },
  {
    'luckasRanarison/nvim-devdocs',
    event = "VeryLazy",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    opts = {
      previewer_cmd = 'glow',
      cmd_args = { '-s', 'dark', '-w', '80' }
    }
  },
  {
    'neovim/nvim-lspconfig',
    dependencies =
    {
      'simrat39/rust-tools.nvim',

      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Autocompletion
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/nvim-cmp',
      {
        'L3MON4D3/LuaSnip',
        event = { "InsertEnter" },
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
    },
  },
  {
    'windwp/nvim-ts-autotag',
    event = { "InsertEnter" },
    opts = {}
  },
  {
    'mattn/emmet-vim',
    event = "InsertEnter"
  },
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    opts = {}
  },
  { 'norcalli/nvim-colorizer.lua' },
  {
    'numToStr/Comment.nvim',
    opts = {},
    lazy = false,
  },
  { 'lukas-reineke/indent-blankline.nvim', main = "ibl", opts = {} },
  { 'HiPhish/rainbow-delimiters.nvim' },
  {
    'Alexis12119/nightly.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'eandrju/cellular-automaton.nvim',
    event = 'VeryLazy'
  },
  { 'xiyaowong/transparent.nvim' },
  { 'nvim-treesitter/nvim-treesitter-textobjects', },
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
    'AndrewRadev/switch.vim',
    cmd = "Switch"
  },
  { "SmiteshP/nvim-navic" },
  {
    "SmiteshP/nvim-navbuddy",

    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = { lsp = { auto_attach = true } }
  },
  {
    "shellRaining/hlchunk.nvim",
    event = { "UIEnter" },
    config = function()
      require("hlchunk").setup({
        blank = {
          enable = false
        },
        indent = {
          enable = false
        },
        hl_chunk = {
          enable = false
        },
        line_num = {
          style = "#71ab2b",
        }
      })
    end
  },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      window = {
        backdrop = 1,
        width = 1,
        height = 1,
        options = {
        },
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false,
          showcmd = false,
        },
        twilight = { enabled = true },
        gitsigns = { enabled = false },
      },
    }
  },
  {
    "folke/twilight.nvim",
    opts = {}
  },
  {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end,
  },
  { 'chentoast/marks.nvim' },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('crates').setup()
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = { hint_prefix = "" },
    config = function(_, opts) require 'lsp_signature'.setup(opts) end
  },
  {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  },
  -- {
  --   'altermo/ultimate-autopair.nvim',
  --   event = { 'InsertEnter', 'CmdlineEnter' },
  --   branch = 'v0.6', --recomended as each new version will have breaking changes
  --   opts = {
  --     --Config goes here
  --   },
  -- },
  { 'akinsho/toggleterm.nvim', version = "*", config = true, cmd = { "TermExec", "ToggleTerm" } },
  { 'folke/neodev.nvim',       opts = {} },
  { 'nvim-lua/popup.nvim' },
  {
    "epwalsh/obsidian.nvim",
    version = "*",
    lazy = true,
    ft = "markdown",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
})
