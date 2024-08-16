local default_settings = {
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
    }
};

function combine_settings(project_root)
    local ra = require("rustaceanvim.config.server")
    local cwd = vim.fn.getcwd()

    local vscode = ra.load_rust_analyzer_settings(project_root, {
        settings_file_pattern = ".vscode/settings.json"
    })

    local vscode_cwd = ra.load_rust_analyzer_settings(cwd, {
        settings_file_pattern = ".vscode/settings.json"
    })

    local rust_analyzer = ra.load_rust_analyzer_settings(project_root, {
        settings_file_pattern = "rust_analyzer.json"
    })

    local rust_analyzer_cwd = ra.load_rust_analyzer_settings(cwd, {
        settings_file_pattern = "rust_analyzer.json"
    })

    local combinded = vim.tbl_deep_extend(
        "keep",
        {},
        default_settings,
        vscode_cwd or {},
        rust_analyzer_cwd or {},
        vscode or {},
        rust_analyzer or {}
    )

    return combinded
end

return {
    {
        "mrcjkb/rustaceanvim",
        lazy = false,
        ft = { "rust" },
        init = function()
            vim.g.rustaceanvim = {
                tools = {
                    enable_clippy = true,
                },
                server = {
                    settings = combine_settings,
                },
            }
        end,
        keys = function() end,
    }
}
