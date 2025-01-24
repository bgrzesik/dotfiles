return {
    {
        "neovim/nvim-lspconfig",
        enabled = false,
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        config = function (_, opts)
            local lspconfig = require("lspconfig")

            lspconfig.pyright.setup {}

            lspconfig.clangd.setup {
                cmd = {
                    "clangd",
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
