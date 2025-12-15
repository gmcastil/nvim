return {

    "L3MON4D3/LuaSnip",

    config = function()
        local ls = require("luasnip")

        ls.config.setup({
            enable_autosnippets = false,
            -- Jump back into a snippet if you accidentally leave it
            history = true, 
            -- This updates the snippet as you type (e.g. for the \end{} auto-repeat)
            update_events = "TextChanged,TextChangedI",
        })

    end,
}
