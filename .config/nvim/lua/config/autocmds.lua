
-- Use kernel style tabs
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.h"},
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.expandtab = false

        vim.diagnostic.enable(false)
    end,
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "rust",
    callback = function()
        vim.opt_local.colorcolumn = { 99 }
    end
})

vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = "gitcommit",
    callback = function()
        vim.opt_local.spell = true
    end
})


vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = {"verilog", "systemverilog"},
    callback = function()
        vim.opt_local.tabstop = 2
        vim.opt_local.shiftwidth = 2
        vim.opt_local.expandtab = true
    end
})