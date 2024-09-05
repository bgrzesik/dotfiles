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

local function combine_settings(project_root)
    local ra = require("rustaceanvim.config.server")
    local json = require('rustaceanvim.config.json')
    local cwd = vim.fn.getcwd()

    local files = {
        {".vscode", "settings.json"},
        {"rust_analyzer.json"},
    }

    local paths = { cwd, project_root }

    local found = {}

    for _, path in ipairs(paths) do
        for _, file in ipairs(files) do
            local name = vim.fs.joinpath(path, unpack(file))

            if vim.fn.filereadable(name) ~= 0 then
                table.insert(found, name)
                print(name)
            end
        end
    end

    local combinded = default_settings

    for _, file in ipairs(found) do
        local f = io.open(file, "r")
        local content = f:read("*all")
        f:close()

        local settings = vim.json.decode(content)

        combinded = vim.tbl_deep_extend("keep", combinded, settings)
    end

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
