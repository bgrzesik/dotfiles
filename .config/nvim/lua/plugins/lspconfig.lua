return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        config = function (_, opts)
            local lspconfig = require("lspconfig")

            lspconfig.pyright.setup {}

            lspconfig.clangd.setup {
                arguments = {
                    "--header-insertion=never",
                },
            }
        end,
        keys = function()
            return {
                { "gh", vim.lsp.buf.hover, desc = "Hover" },
                { "<leader>r", vim.lsp.buf.rename, desc = "Rename" },
            }
        end,
    },
}
