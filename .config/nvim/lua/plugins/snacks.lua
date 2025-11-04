return {
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            animate = {
                duration = 1,
                easing = "linear",
                fps = 144,
            },
            bigfile = { enabled = true },
            dashboard = { enabled = true },
            git = { enabled = true },
            explorer = {
                enabled = true,
                replace_netrw = false,
            },
            indent = { enabled = true },
            input = { enabled = true },
            picker = {
                enabled = true,
                ui_select = true,
                files = {
                    hidden = true,
                },
            },
            notifier = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = {
                enabled = true,
                animate = {
                    duration = { step = 15, total = 45, },
                },
            },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            zen = {
                enabled = true,
                win = { backdrop = { transparent = false, }, },
            },
        },
        keys = function()
            return {
                {
                    "<space>/",
                    function()
                        Snacks.picker.grep({ hidden = true })
                    end,
                },
                {
                    "<C-p>",
                    function()
                        Snacks.picker.files({ hidden = true })
                    end,
                },
                {
                    "<space>r",
                    function()
                        Snacks.picker.recent()
                    end,
                },
                {
                    "<space>e",
                    function()
                        Snacks.picker.explorer()
                    end,
                },
                {
                    "<space>a",
                    function()
                        Snacks.picker.files({
                            hidden = true,
                            dirs = { "arch/arm64/kvm" },
                        })
                    end,
                },
                {
                    "<space>A",
                    function()
                        Snacks.picker.grep({
                            hidden = true,
                            dirs = { "arch/arm64/kvm" },
                        })
                    end,
                },
                {
                    "<space>p",
                    function()
                        Snacks.picker.pickers()
                    end,
                },
                {
                    "<space>s",
                    function()
                        Snacks.picker.lsp_workspace_symbols()
                    end,
                },
                {
                    "<space>o",
                    function()
                        Snacks.picker.lsp_symbols()
                    end,
                },
                {
                    "gd",
                    function()
                        Snacks.picker.lsp_definitions()
                    end,
                },
                {
                    "gi",
                    function()
                        Snacks.picker.lsp_implementations()
                    end,
                },
                {
                    "gr",
                    function()
                        Snacks.picker.lsp_references()
                    end,
                },
            }
        end,
    }
}
