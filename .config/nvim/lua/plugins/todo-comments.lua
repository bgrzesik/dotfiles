return {
    "folke/todo-comments.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        keywords = {
            SAFETY = { color = "hint" },
        },
        highlight = {
            pattern = {
                [[.*<((KEYWORDS)\s*(\(.*\))?)\s*:]]
            },
        },    
    },
}
