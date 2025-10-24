
local function on_attach()
    vim.lsp.inlay_hint.enable(true)
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
                on_attach,
                cmd = {
                    "clangd",
                    "--header-insertion=never",
                },
            })
            lsp.enable("clangd")

            lsp.enable("ts_ls")
        end,
        keys = function()
            return {
                { "gh", vim.lsp.buf.hover, desc = "Hover" },
                { "<leader>r", vim.lsp.buf.rename, desc = "Rename" },
            }
        end,
    },
}
