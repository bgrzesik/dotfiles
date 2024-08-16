return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = {
                    "c",
                    "cpp",
                    "rust",
                    "lua",
                    "vim",
                    "vimdoc",
                    "query",
                    "markdown",
                    "markdown_inline",
                },
                highlight = {
                    enable = true,
                },
            })
        end,
        build = function()
            require("nvim-treesitter.install").update({ with_sync = true })()
        end,
    },
}
