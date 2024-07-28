return {
    {
        "mrcjkb/rustaceanvim",
        ft = { "rust" },
        opts = {
            server = {
                default_settings = {
                    ["rust-analyzer"] = {
                        checkOnSave = {
                            command = "clippy",
                        },
                        imports = {
                            granularity = {
                                group = "item",
                                enforce = true,
                            },
                            prefix = "crate",
                        },
                        cargo = {
                            allFeatures = true,
                            buildScripts = {
                                enable = true,
                            },
                        },
                        procMacro = {
                            enable = true,
                            ignored = {},
                        },
                    },
                },
            },
        },
        config = function (_, opts)
            vim.g.rustaceanvim = opts or {}
        end,
        keys = function() end,
    }
}
