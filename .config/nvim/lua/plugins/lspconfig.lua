return {
    {
        "neovim/nvim-lspconfig",
        ---@class PluginLspOpts
        opts = {
            autoformat = false,
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
                {
                    "<S-Tab>",
                    function()
                        vim.cmd("ClangdSwitchSourceHeader")
                    end,
                },
            }
        end,
    },
}
