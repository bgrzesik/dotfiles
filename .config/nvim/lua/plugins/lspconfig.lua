return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            setup = {
                rust_analyzer = function()
                    return true
                end,
            },
            servers = {
                pyright = {},
                clangd = {
                    arguments = {
                        "--header-insertion=never",
                    },
                },
            },
        },
        keys = function()
            return {
                { "gh", vim.lsp.buf.hover, desc = "Hover" },
                { "<leader>r", vim.lsp.buf.rename, desc = "Rename" },
            }
        end,
    },
}
