return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                rust = { "rustfmt", lsp_format = "fallback" },
                cpp = { "clang-format" },
                c = { "clang-format" },
            },
        },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format({ async = true })
                end,
            },
        },
    }
}
