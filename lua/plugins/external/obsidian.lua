return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("obsidian").setup({
      workspaces = {
        {
          name = "knowledge",
          path = "/home/andy/vaults/Knowledge/",
        },
      },
      daily_notes = {
        folder = "dailies",
        date_format = "%d-%m-%Y, %A",
        template = "Templates/Daily.md",
      },
      node_id_func = function(title)
        return "test"
      end,
    })
    vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>")
    vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>")
    vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>")
    vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>")
    vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>")
  end,
}
