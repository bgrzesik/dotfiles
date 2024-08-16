return {
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {
            style = "night",
            dim_inactive = true,

            on_highlights = function(hl, c)
                hl.ColorColumn = {
                    bg = c.black
                }
            end,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)

            vim.cmd.colorscheme("tokyonight")
        end
    }
}
