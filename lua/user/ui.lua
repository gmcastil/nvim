function SetStatusLine()
    vim.o.laststatus = 2
    vim.o.statusline = table.concat({
        "%{mode()}",                                        -- Mode
        " %{expand('$USER')}@",                             -- Username
        "%{hostname()}",                                    -- Host
        ":%{substitute(expand('%:p'), expand('$HOME'), '~', '')}",  -- Rsync-friendly full path
        " %{&modified ? '[+]' : ''}",                       -- Modified
        " %{&readonly ? '[RO]' : ''}",                      -- Readonly
        " %{FugitiveStatusline()}",                         -- Git info from Fugitive
        " %=",                                              -- Right-align
        "%l:%c",                                            -- Line:Column
    })

end

SetStatusLine()





