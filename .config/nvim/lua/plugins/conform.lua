return {
    {
        'stevearc/conform.nvim',
        opts = {
            formatters_by_ft = {
                lua = { "stylua" },
                python = { "black" },
                javascript = { lsp_format = "fallback" },
                rust = { "rustfmt", lsp_format = "fallback" },
                cpp = { "clang-format" },
                c = { "clang-format" },
                bp = { "bpfmt" },
                bzl = { "buildifier" },
                systemverilog = { "verible" },
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
        init = function()
            vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
        end,
    }
}
