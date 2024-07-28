return {
    {
        "nvim-telescope/telescope.nvim",
        dependencies = {
            "nvim-telescope/telescope-fzf-native.nvim",
	    "nvim-telescope/telescope-file-browser.nvim",
        },
        ops = {
            extensions = {
                file_browser = {
                },
                fzf = {
                    fuzzy = true,
                    case_mode = "smart_case",
                },
            },
        },
        keys = function()
            local builtin = require("telescope.builtin")
            local extensions = require("telescope").extensions;

            return {
                { "<C-K>", builtin.buffers },
                { "<C-/>", builtin.live_grep },
                { "<C-p>", builtin.find_files },
                { "<space>t", builtin.builtin },
                { "<space>o", builtin.lsp_document_symbols },
                { "<space>s", builtin.lsp_dynamic_workspace_symbols },
                { "gi", builtin.lsp_implementations },
                { "gd", builtin.lsp_definitions },
                { "gr", builtin.lsp_references },
                { "<C-t>", extensions.file_browser.file_browser },
            }
        end,
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
    },
    {
        "nvim-telescope/telescope-file-browser.nvim",
        dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
    },
}
