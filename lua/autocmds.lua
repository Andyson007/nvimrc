vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- jump to last edit position on opening file
-- Credit @jonhoo
vim.api.nvim_create_autocmd(
  'BufReadPost',
  {
    pattern = '*',
    callback = function(ev)
      if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
        -- except for in git commit messages
        if not vim.fn.expand('%:p'):find('.git', 1, true) then
          vim.cmd('exe "normal! g\'\\""')
        end
      end
    end
  }
)

local function get_return_line(lines)
  local line_nr = vim.v.foldstart
  repeat
    local line = vim.fn.getline(line_nr)
    if string.find(line, '->') then
        local return_type = string.gmatch(line, '-> *(.*){')()
        if not (return_type == nil) then
          return return_type
        end
        local ret = string.gmatch(line, '->(.*)')()
        while not string.find(line, '{') do
          ret = ret .. vim.fn.getline(line_nr)
        end
        ret = ret .. string.gmatch(line, '^(.*){')
        return ret
    end
    line_nr = line_nr + 1
  until (not string.find(vim.fn.getline(line_nr), '{') == nil) or line_nr == vim.v.foldend
  local last_line = vim.fn.getline(vim.v.foldend - 1)
  last_line = string.gsub(last_line, '^ *', '')
  last_line = string.gsub(last_line, ' *$', '')
  return last_line
end

vim.api.nvim_create_autocmd(
  'FileType',
  {
    pattern = 'ktane',
    callback = function(ev)
      function custom_fold_text()
        local first_line = vim.fn.getline(vim.v.foldstart)
        local name = string.gmatch(first_line, '([^(]*)')()
        local return_value = get_return_line()
        local line_count = vim.v.foldend - vim.v.foldstart + 1
        
        return name .. ' -> ' .. return_value .. ' ⚡' .. line_count .. ' lines'
      end
      vim.opt.foldtext = 'v:lua.custom_fold_text()'
      vim.api.nvim_set_hl(0, 'Folded', { fg = "lightgreen" })
    end
  }
)
