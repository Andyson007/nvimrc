vim.api.nvim_set_keymap('n', '&&', ':lua require("jump-tag").jumpParent()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '&n', ':lua require("jump-tag").jumpNextSibling()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '&p', ':lua require("jump-tag").jumpPrevSibling()<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '&c', ':lua require("jump-tag").jumpChild()<CR>', { noremap = true, silent = true})
