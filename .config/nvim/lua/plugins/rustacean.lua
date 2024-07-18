return {
    "mrcjkb/rustaceanvim",
    opts = {
        server = {
            default_settings = {
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
                },
            },
        },
    },
    keys = function() end,
}
