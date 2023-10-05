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
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
      }
    }
  },
  { 'nvim-treesitter/nvim-treesitter' },
  { 'nvim-treesitter/playground' },
  { 'tpope/vim-fugitive' },
  { 'sindrets/diffview.nvim' },
  { 'tpope/vim-surround' },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      preview_config = {
        border = "none",
      },
    },
  }, {
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
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/nvim-cmp' },
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
    }
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
  { 'Alexis12119/nightly.nvim' },
  {
    'eandrju/cellular-automaton.nvim',
    event = 'VeryLazy'
  },
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
    'AndrewRadev/switch.vim',
    cmd = "Switch"
  },
  {
    'monaqa/dial.nvim',
    cmd = {
      "DialDecrement",
      "DialIncrement",
    }
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
        backdrop = 1, -- shade the backdrop of the Zen window. Set to 1 to keep the same as Normal
        -- height and width can be:
        -- * an absolute number of cells when > 1
        -- * a percentage of the width / height of the editor when <= 1
        -- * a function that returns the width or the height
        width = 1,  -- width of the Zen window
        height = 1, -- height of the Zen window
        -- by default, no options are changed for the Zen window
        -- uncomment any of the options below, or add other vim.wo options you want to apply
        options = {
          -- signcolumn = "no", -- disable signcolumn
          -- number = false, -- disable number column
          -- relativenumber = false, -- disable relative numbers
          -- cursorline = false, -- disable cursorline
          -- cursorcolumn = false, -- disable cursor column
          -- foldcolumn = "0", -- disable fold column
          -- list = false, -- disable whitespace characters
        },
      },
      plugins = {
        -- disable some global vim options (vim.o...)
        -- comment the lines to not apply the options
        options = {
          enabled = true,
          ruler = false,                -- disables the ruler text in the cmd line area
          showcmd = false,              -- disables the command in the last line of the screen
        },
        twilight = { enabled = true },  -- enable to start Twilight when zen mode opens
        gitsigns = { enabled = false }, -- disables git signs
      },
      -- callback where you can add custom code when the Zen window opens
      -- on_open = function(win)
      -- end,
      -- callback where you can add custom code when the Zen window closes
      -- on_close = function()
      -- end,
    }
  },
  {
    "folke/twilight.nvim",
    opts = {}
  },
  { 'stefandtw/quickfix-reflector.vim' },
  { 'kevinhwang91/nvim-bqf' },
  {
    'junegunn/fzf',
    run = function()
      vim.fn['fzf#install']()
    end,
  },
  { 'chentoast/marks.nvim' },
  { 'simrat39/rust-tools.nvim' },
  {
    'saecki/crates.nvim',
    tag = 'v0.3.0',
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
  {
    -- amongst your other plugins
  },
})
