
-- Use kernel style tabs
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.h"},
    callback = function()
        vim.opt.tabstop = 8
        vim.opt.shiftwidth = 8
        vim.opt.expandtab = false
    end,
})