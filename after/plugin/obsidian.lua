local opts = {
  workspaces = {
    {
      name = "knowledge",
      path = "/mnt/c/Users/Andy/Documents/vaults/Knowledge",
    },
  },
  daily_notes = {
    folder = "dailies",
    date_format = "%d-%m-%Y, %A",
    template = "Templates/Daily.md"
  },
}
require 'obsidian'.setup(opts)

vim.keymap.set("n", "<leader>of", "<cmd>ObsidianQuickSwitch<cr>")
vim.keymap.set("n", "<leader>on", "<cmd>ObsidianNew<cr>")
vim.keymap.set("n", "<leader>ob", "<cmd>ObsidianBacklinks<cr>")
vim.keymap.set("n", "<leader>ot", "<cmd>ObsidianTags<cr>")
vim.keymap.set("n", "<leader>os", "<cmd>ObsidianSearch<cr>")
