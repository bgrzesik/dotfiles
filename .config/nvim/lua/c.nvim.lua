-- C exrc file
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.h"},
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.expandtab = false

        vim.diagnostic.enable(false)


        vim.opt_local.path = vim.tbl_deep_extend("keep", {}, vim.opt_local.path, {
            ".",
            "src",
        })
    end,
})
