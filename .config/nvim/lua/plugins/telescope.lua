return {
    "nvim-telescope/telescope.nvim",
    keys = function()
        local builtin = require("telescope.builtin")

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
        }
    end,
}
