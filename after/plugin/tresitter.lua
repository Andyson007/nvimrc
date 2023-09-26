require 'nvim-treesitter.configs'.setup {
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<CR>",
      node_incremental = "<CR>",
      scope_incremental = "<S-CR>",
      node_decremental = "<BS>",
    },
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  ensure_installed = {
    "html",
  },
  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,


    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  playground = {
    enable = true,
    disable = {},
    updatetime = 25,         -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = 'o',
      toggle_hl_groups = 'i',
      toggle_injected_languages = 't',
      toggle_anonymous_nodes = 'a',
      toggle_language_display = 'I',
      focus_language = 'f',
      unfocus_language = 'F',
      update = 'R',
      goto_node = '<cr>',
      show_help = '?',
    },
  },
}

local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"

local q = require("vim.treesitter.query")

local function getattributesQuery(query)
  local bufnr = vim.api.nvim_get_current_buf()
  local language_tree = vim.treesitter.get_parser(bufnr, 'css')
  local syntax_tree = language_tree:parse();
  local root = syntax_tree[1]:root()
  local ret = {}
  for _, captures, metadata in query:iter_matches(root, bufnr) do
    local temp = {}
    table.insert(temp, q.get_node_text(captures[1], bufnr))
    table.insert(temp, metadata)
    table.insert(ret, temp)
  end
  return ret
end
local function getattributes(lang, query)
  return getattributesQuery(vim.treesitter.query.parse(lang,query))
end

local findAttributes = function(opts, attributes)
  opts = opts or {}
  pickers.new(opts, {
    prompt_title = "attributes",
    preview = conf.grep_previewer(opts),
    finder = finders.new_table {
      results = attributes,
      entry_maker = function(entry)
        -- vim.fn.input(vim.inspect(entry[2][2].range[1]))
        return {
          value = entry[1],
          display = entry[1],
          ordinal = entry[1],
          lnum = entry[2][2].range[1] + 1,
        }
      end
    },
    sorter = conf.generic_sorter(),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        -- vim.fn.input(vim.inspect(selection))
        vim.cmd(tostring(selection.lnum))
      end)
      return true
    end,
  }):find()
end

CssAttributes = function(opts)
  return findAttributes(opts, getattributes('css', [[
(rule_set
  (selectors
       ) @name
@method (#offset! @method))
]]))
end

vim.keymap.set("n", "<leader>pa", "<cmd>lua CssAttributes(require'telescope.themes'.get_dropdown {})<CR>")
