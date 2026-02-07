return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = true }
  },
  dependencies = {
    { "j-hui/fidget.nvim", opts = {} },
    { "folke/neodev.nvim", opts = {} },
    "saghen/blink.cmp",
    {"aznhe21/actions-preview.nvim", opts = {}},
    {
      "hedyhli/outline.nvim",
      opts = {
        preview_window = {
          auto_preview = true,
        }
      },
      config = function(_, opts)
        -- Example mapping to toggle outline
        vim.keymap.set("n", "<leader>na", "<cmd>Outline<CR>",
          { desc = "Toggle Outline" })

        require("outline").setup (
          opts
          -- Your setup opts here (leave empty to use defaults)
        )
      end,
    }
  },
  config = function(opts)
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
      callback = function(event)
        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
        map("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
        map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
        map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
        map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
        map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")

        map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
        map("<leader>ca", require("actions-preview").code_actions, "[C]ode [A]ction")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")

        map("dp", vim.diagnostic.goto_prev, "[d]iagnostic [p]revious")
        map("dn", vim.diagnostic.goto_next, "[d]iagnostic [n]ext")

        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event2)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
            end,
          })
        end

        if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
          vim.keymap.set("n", "<leader>th", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
          end, { desc = "[T]oggle Inlay [H]ints" })
        end
      end,
    })

    for key, value in pairs({"ts_ls", "biome", "html", "emmet_language_server", "emmet_ls", "cssls", "tailwindcss", "clangd", "taplo", "sqlls", "jsonls", "bashls", "hls", "nixd", "csharp_ls", "intelephense", "asm_lsp", "dartls", "arduino_language_server", "svelte", "tinymist", "omnisharp", "qmlls", "pylsp" }) do
      -- vim.lsp.enable(value)
      vim.lsp.enable(value)
    end

    vim.lsp.config.lua_ls.settings = {
      Lua = {
        completion = {
          callSnippet = "Replace",
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    }

    vim.lsp.config('ktane', {
      cmd = { '/home/andy/projects/ktane-ls/target/release/ktane-ls' },
      filetypes = {'ktane'},
    })
    vim.lsp.enable('ktane')
  end,
}
