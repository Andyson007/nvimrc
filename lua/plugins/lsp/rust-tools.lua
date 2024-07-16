return {
  {
    {
      'mrcjkb/rustaceanvim',
      version = '^4', -- Recommended
      lazy = false,   -- This plugin is already lazy
      ft = { "rust" },
      server = {
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            procMacro = {
              ignored = {
                leptos_macro = {
                  -- optional: --
                  -- "component",
                  "server",
                },
              },
            },
          },
        },
      },
    },
  },
  {

    "saecki/crates.nvim",
    tag = "stable",
    config = function()
      require("crates").setup()
      local crates = require("crates")
      vim.keymap.set("n", "<leader>ct", crates.toggle, { desc = "[C]rates [T]oggle virtual text" })
      vim.keymap.set("n", "<leader>cr", crates.reload, { desc = "[C]rates [R]load" })

      vim.keymap.set("n", "<leader>cv", crates.show_versions_popup, { desc = "[C]rates [V]ersions" })
      vim.keymap.set("n", "<leader>cf", crates.show_features_popup, { desc = "[C]rates show [F]eatures" })
      vim.keymap.set("n", "<leader>cd", crates.show_dependencies_popup, { desc = "[C]rates show [D]ependencies" })

      vim.keymap.set(
        { "n", "v" },
        "<leader>cu",
        crates.update_crate,
        { desc = "[C]rates [u]pdate (includes major versions) 1.1 -> 1.9" }
      )
      vim.keymap.set(
        { "n", "v" },
        "<leader>cU",
        crates.upgrade_crate,
        { desc = "[C]rates [u]pgrade (ignores major versions) 1.1 -> 2.0" }
      )
    end,
  },
}
