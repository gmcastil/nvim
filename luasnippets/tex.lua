local ls = require("luasnip")
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- The 'beg' snippet for starting a begin-end environment
    s("beg", {
        t("\\foo-begin{"), i(1), t("}"),
        t({"", "\t"}), i(0),
        t({"", "\\end{"}), rep(1), t("}"),
    }),

    -- Display math use 'dm'
    s("dm", {
        t({ "\\[", "    " }), i(1),
        t({ "", "\\]" }),
        i(0),
    }),
}

