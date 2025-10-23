return {
  {
    "windwp/nvim-ts-autotag",
    event = { "InsertEnter" },
    opts = {},
  },
  {
    "mattn/emmet-vim",
    event = "InsertEnter",
    config = function() 
      vim.g.user_emmet_update_tag = "<C-Z>u"
      vim.g.user_emmet_next_key = "<C-n>"
    end
  },
}
