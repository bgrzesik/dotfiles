return {
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
        return {
            {
                "<Tab>",
                function()
                    require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
                end,
            },
        }
    end,
}
