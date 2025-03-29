
local function on_attach()
    vim.lsp.inlay_hint.enable(true)
end

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        config = function (_, opts)
            local lspconfig = require("lspconfig")

            lspconfig.pyright.setup {
                on_attach,
            }

            lspconfig.clangd.setup {
                on_attach,
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
