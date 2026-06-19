return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        lazy = false,
        init = function()
            local ensure_installed = {
                "bp",
                "c",
                "cpp",
                "rust",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline",
            }

            local installed = require('nvim-treesitter.config').get_installed()
            local missing = vim.iter(ensure_installed)
                :filter(function(parser)
                        return not vim.tbl_contains(installed, parser)
                end)
                :totable()

            require('nvim-treesitter').install(missing)
        end,
        build = ":TSUpdate",
    },
}