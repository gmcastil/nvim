local ls = require("luasnip")
local rep = require("luasnip.extras").rep

local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
    -- The 'beg' snippet for starting a begin-end environment
    s("beg", {
        t("\\begin{"), i(1), t("}"),
        t({"", "\t"}), i(0),
        t({"", "\\end{"}), rep(1), t("}"),
    }),

    -- Display math use 'dm'
    s("dm", {
        t({ "\\[", "    " }), i(1),
        t({ "", "\\]" }),
        i(0),
    }),

    -- Piecewise function definition

    -- Problem environment
    s({ trig = "prob", dscr = "Problem environment with label" }, {
        t({ "\\begin{problem}\\label{prob:" }),
        i(1),               -- Cursor lands here
        t({ "}", "" }),
        t({ "    " }),
        i(2),
        t({ "", "\\end{problem}" }),
    }),

    s({ trig = "probp", dscr = "Problem with psubparts (2 items)" }, {
        t({ "\\begin{problem}\\label{prob:" }),
        i(1),               -- Cursor lands here
        t({ "}", "" }),
        t({ "    " }),
        i(2),
        t({ "", "    \\begin{psubparts}", "        \\item " }),
        i(3),
        t({ "", "        \\item " }),
        i(4),
        t({ "", "    \\end{psubparts}", "\\end{problem}" }),
    })


}

