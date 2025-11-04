
local function on_attach()
    vim.lsp.inlay_hint.enable(true)
end

local function clangd_on_attach(client)
    on_attach()

    client.server_capabilities.semanticTokensProvider = nil
    vim.lsp.inlay_hint.enable(false)
end

return {
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "LspInfo", "LspInstall", "LspUninstall" },
        config = function (_, opts)
            local lsp = vim.lsp;

            lsp.config("pyright",  {
                on_attach,
            })
            lsp.enable("pyright")

            lsp.config("clangd", {
                clangd_on_attach,
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                },
            })
            lsp.enable("clangd")

            lsp.enable("ts_ls")

            lsp.enable("verible")
        end,
        keys = function()
            return {
                { "gh", vim.lsp.buf.hover, desc = "Hover" },
                { "<leader>r", vim.lsp.buf.rename, desc = "Rename" },
            }
        end,
    },
}
