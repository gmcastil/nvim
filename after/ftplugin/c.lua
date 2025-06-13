-- Set preprocessed filetypes as C files as well (usually need to run through
-- indent as well)
vim.filetype.add({
    extension = {
        i = "c",
        dts = "c"
    }
})
