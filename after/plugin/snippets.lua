local ls = require("luasnip")
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local l = require("luasnip.extras").lambda
local r = require("luasnip.extras").rep
local p = require("luasnip.extras").partial
local m = require("luasnip.extras").match
local n = require("luasnip.extras").nonempty
local dl = require("luasnip.extras").dynamic_lambda
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local types = require("luasnip.util.types")
local conds = require("luasnip.extras.expand_conditions")
local rep = require("luasnip.extras").rep

ls.config.set_config {
  history = true,

  updateevents = "TextChanged,TextChangedI",

  enable_autosnippets = true,
}

vim.keymap.set({ "i", "s" }, "<C-t>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-p>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true })

vim.keymap.set({ "i", "s" }, "<C-l>", function()
  if ls.choice_active() then
    ls.change_choice(1)
  end
end)

require("luasnip.loaders.from_vscode").lazy_load()
local function copy(args)
  return args[1]
end

-- 'recursive' dynamic snippet. Expands to some text followed by itself.
local rec_ls
rec_ls = function()
  return sn(
    nil,
    c(1, {
      -- Order is important, sn(...) first would cause infinite loop of expansion.
      t(""),
      sn(nil, { t({ "", "\t\\item " }), i(1), d(2, rec_ls, {}) }),
    })
  )
end

-- complicated function for dynamicNode.
local function jdocsnip(args, _, old_state)
  -- !!! old_state is used to preserve user-input here. DON'T DO IT THAT WAY!
  -- Using a restoreNode instead is much easier.
  -- View this only as an example on how old_state functions.
  local nodes = {
    t({ "/**", " * " }),
    i(1, "A short Description"),
    t({ "", "" }),
  }

  -- These will be merged with the snippet; that way, should the snippet be updated,
  -- some user input eg. text can be referred to in the new snippet.
  local param_nodes = {}

  if old_state then
    nodes[2] = i(1, old_state.descr:get_text())
  end
  param_nodes.descr = nodes[2]

  -- At least one param.
  if string.find(args[2][1], ", ") then
    vim.list_extend(nodes, { t({ " * ", "" }) })
  end

  local insert = 2
  for indx, arg in ipairs(vim.split(args[2][1], ", ", true)) do
    -- Get actual name parameter.
    arg = vim.split(arg, " ", true)[2]
    if arg then
      local inode
      -- if there was some text in this parameter, use it as static_text for this new snippet.
      if old_state and old_state[arg] then
        inode = i(insert, old_state["arg" .. arg]:get_text())
      else
        inode = i(insert)
      end
      vim.list_extend(
        nodes,
        { t({ " * @param " .. arg .. " " }), inode, t({ "", "" }) }
      )
      param_nodes["arg" .. arg] = inode

      insert = insert + 1
    end
  end

  if args[1][1] ~= "void" then
    local inode
    if old_state and old_state.ret then
      inode = i(insert, old_state.ret:get_text())
    else
      inode = i(insert)
    end

    vim.list_extend(
      nodes,
      { t({ " * ", " * @return " }), inode, t({ "", "" }) }
    )
    param_nodes.ret = inode
    insert = insert + 1
  end

  if vim.tbl_count(args[3]) ~= 1 then
    local exc = string.gsub(args[3][2], " throws ", "")
    local ins
    if old_state and old_state.ex then
      ins = i(insert, old_state.ex:get_text())
    else
      ins = i(insert)
    end
    vim.list_extend(
      nodes,
      { t({ " * ", " * @throws " .. exc .. " " }), ins, t({ "", "" }) }
    )
    param_nodes.ex = ins
    insert = insert + 1
  end

  vim.list_extend(nodes, { t({ " */" }) })

  local snip = sn(nil, nodes)
  -- Error on attempting overwrite.
  snip.old_state = param_nodes
  return snip
end

-- Make sure to not pass an invalid command, as io.popen() may write over nvim-text.
local function bash(_, _, command)
  local file = io.popen(command, "r")
  local res = {}
  for line in file:lines() do
    table.insert(res, line)
  end
  return res
end

-- Returns a snippet_node wrapped around an insertNode whose initial
-- text value is set to the current date in the desired format.
local date_input = function(args, snip, old_state, fmt)
  local fmt = fmt or "%Y-%m-%d"
  return sn(nil, i(1, os.date(fmt)))
end

ls.add_snippets("lua", {
  s("req", fmt(
    [[local {} = require "{}"]],
    {
      f(function(import_name)
        local parts = vim.split(import_name[1][1], ".", true)
        return parts[#parts] or ""
      end, { 1 }),
      i(1, "default.test")
    }
  ))
})

ls.add_snippets("cpp", {
  s("aoc", fmt(
    [[
#include <iostream>
{}

int main (int argc, char *argv[]) {{
  std::ifstream fin(argv[1]);
  {}
  return 0;
}}
  ]],{
    c(1, {t("#include <fstream>"), t("")}),
    i(2)
  }
  ))
})

ls.add_snippets("js", { -- Doesn't load in js idk why
  s("id", fmt(
    [[const {} = document.getElementById("{}");]],{
      i(1, "id"),
      rep(1)
  }
  ))
})
