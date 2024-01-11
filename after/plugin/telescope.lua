local builtin = require('telescope.builtin')

require('telescope').setup({
  extensions = {
    fzf = {
      fuzzy = true,                   -- false will only do exact matching
      override_generic_sorter = true, -- override the generic sorter
      override_file_sorter = true,    -- override the file sorter
      case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
      -- the default case_mode is "smart_case"
    }
  },
})

vim.keymap.set('n', '<leader>bb', builtin.builtin, {})
vim.keymap.set('n', '<leader>tt', builtin.treesitter, {})
vim.keymap.set('n', '<leader>pr', builtin.resume, {})
vim.keymap.set('n', '<leader>he', builtin.help_tags, {})
vim.keymap.set('n', '<leader>ke', builtin.keymaps, {})
vim.keymap.set('n', '<leader>hi', builtin.highlights, {})
vim.keymap.set('n', '<leader>gd', builtin.lsp_implementations, {})
vim.keymap.set('n', '<leader>gr', builtin.lsp_references, {})
vim.keymap.set('n', '<leader>gD', builtin.lsp_definitions, {})
vim.keymap.set('n', '<leader>gty', builtin.lsp_type_definitions, {})
vim.keymap.set('n', '<leader>pd', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>ph', builtin.command_history, {})
vim.keymap.set('n', '<leader>p/', builtin.search_history, {})
vim.keymap.set('n', '<leader>pb', builtin.buffers, {})
vim.keymap.set('n', '<leader>po', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>vi', builtin.vim_options, {})
vim.keymap.set('n', '<leader>gp', builtin.git_files, {})
vim.keymap.set('n', '<leader>pp', builtin.jumplist, {})
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gc', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gt', builtin.git_stash, {})
vim.keymap.set('n', '<leader>pg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').load_extension('fzf')
require('telescope').load_extension('frecency')
vim.keymap.set("n", "<leader><leader>pf", "<Cmd>Telescope frecency<cr>")
