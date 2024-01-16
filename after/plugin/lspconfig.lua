require('neodev').setup({})
require('crates').setup()
require("mason").setup()

require("mason-lspconfig").setup({
  automatic_installation = false,
})

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = args.buf })
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = args.buf })
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, { buffer = args.buf })
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, { buffer = args.buf })

    vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { buffer = args.buf })

    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, { buffer = args.buf })
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, { buffer = args.buf })
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, { buffer = args.buf })
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { buffer = args.buf })
    vim.keymap.set("n", "<leader>h", function() vim.lsp.buf.document_highlight() end, { buffer = args.buf })

    vim.keymap.set('n', 'dp', vim.diagnostic.goto_prev, { buffer = args.buf })
    vim.keymap.set('n', 'dn', vim.diagnostic.goto_next, { buffer = args.buf })
  end,
})


local lsp = require 'lspconfig'
vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }

local cmp = require 'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
  -- window = {
  --   completion = cmp.config.window.bordered(),
  --   documentation = cmp.config.window.bordered(),
  -- },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-t>'] = cmp.mapping.confirm({ select = true }),  -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    ['<Tab>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'crates' },
  })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

local crates = require('crates')
local opts = { silent = true }

vim.keymap.set('n', '<leader>ct', crates.toggle, opts)
vim.keymap.set('n', '<leader>cr', crates.reload, opts)

vim.keymap.set('n', '<leader>cv', crates.show_versions_popup, opts)
vim.keymap.set('n', '<leader>cf', crates.show_features_popup, opts)
vim.keymap.set('n', '<leader>cd', crates.show_dependencies_popup, opts)

vim.keymap.set('n', '<leader>cu', crates.update_crate, opts)
vim.keymap.set('v', '<leader>cu', crates.update_crates, opts)
vim.keymap.set('n', '<leader>cU', crates.upgrade_crate, opts)
vim.keymap.set('v', '<leader>cU', crates.upgrade_crates, opts)

for key, value in pairs({ lsp.tsserver, lsp.biome, lsp.html, lsp.emmet_language_server, lsp.cssls, lsp.tailwindcss, lsp.clangd, lsp.lua_ls }) do
  value.setup {
    capabilities = capabilities,
  }
end

lsp.rust_analyzer.setup {
  capabilities = capabilities,
}
