return {
  "L3MON4D3/LuaSnip",
  build = (function()
    -- Build Step is needed for regex support in snippets.
    -- This step is not supported in many windows environments.
    -- Remove the below condition to re-enable on windows.
    if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
      return
    end
    return "make install_jsregexp"
  end)(),
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local isn = ls.indent_snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local f = ls.function_node
    local c = ls.choice_node
    local d = ls.dynamic_node
    local r = ls.restore_node
    local events = require("luasnip.util.events")
    local ai = require("luasnip.nodes.absolute_indexer")
    local extras = require("luasnip.extras")
    local l = extras.lambda
    local rep = extras.rep
    local p = extras.partial
    local m = extras.match
    local n = extras.nonempty
    local dl = extras.dynamic_lambda
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local conds = require("luasnip.extras.expand_conditions")
    local postfix = require("luasnip.extras.postfix").postfix
    local types = require("luasnip.util.types")
    local parse = require("luasnip.util.parser").parse_snippet
    local ms = ls.multi_snippet
    local k = require("luasnip.nodes.key_indexer").new_key

    vim.keymap.set({"i", "s"}, "<C-d>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, {silent = true})

    vim.keymap.set({"i", "s"}, "<C-@>", function() ls.jump( 1) end, {silent = true})
    vim.keymap.set({"i", "s"}, "<C-->", function() ls.jump(-1) end, {silent = true})

    ls.add_snippets("all", {
      s("ternary", {
        -- equivalent to "${1:cond} ? ${2:then} : ${3:else}"
        i(1, "cond"), t(" ? "), i(2, "then"), t(" : "), i(3, "else")
      })
    })
    ls.add_snippets("rust", {
      s("aoc", {
        t({
          "fn main() {",
          "    let ans = solve(include_str!(\"../../input\"));",
          "    println!(\"{ans}\")";
          "}",
          "",
          "pub fn solve(input: &str) -> usize {",
          "    ",
        }),
        i(0, "todo!()"),
        t({
          "",
          "}",
          "",
          "#[cfg(test)]",
          "mod test {",
          "    use crate::solve;",
          "",
          "    #[test]",
          "    fn example() {",
          "        let ans = solve(r\"\");",
          "        assert_eq!(ans, todo!())",
          "    }",
          "}",
        }),
      }),
      s("main", {
        t({"fn main() {", "    "}),
        i(1),
        t({"", "}"}),
      }),
      s("readline", {
        c(1, {
          t({"buf.clear();", ""}), 
          t({"let mut buf = String::new();", ""})
        }),
        t({"io::stdin().read_line(&mut buf).unwrap();", ""})
      }),
      s("parse", {
        t("let "), i(1), t(" = buf.trim().parse::<"), c(2, {t("usize"), t("isize")}), t({">().unwrap();", ""})
      }),
      s("parselist", {
        t("let "), i(1, "items"), t(": Vec<_> = buf.split_whitespace().map(|x| "), i(2, "x.parse::<usize>().unwrap()"), t({").collect();", ""})
      }),
    })
  end,
  dependencies = {},
}
