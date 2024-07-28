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

                settings = function(project_root)
                    local ra = require("rustaceanvim.config.server")

                    local vscode = ra.load_rust_analyzer_settings(project_root, {
                        settings_file_pattern = ".vscode/settings.json"
                    })

                    local rust_analyzer = ra.load_rust_analyzer_settings(project_root, {
                        settings_file_pattern = "rust_analyzer.json"
                    })

                    return vim.tbl_deep_extend("keep", {}, vscode, rust_analyzer)
                end,
            },
        },
        config = function (_, opts)
            vim.g.rustaceanvim = opts or {}
        end,
        keys = function() end,
    }
}
