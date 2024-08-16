-- C exrc file

-- Use kernel style formatting and improve gf slightly
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.h"},
    callback = function()
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.expandtab = false

        vim.opt_local.path = vim.tbl_deep_extend("keep", {}, vim.opt_local.path, {
            ".",
            "src",
            "include",
        })
    end,
})

-- Disables clangd for this project if compile_commands.json does not exists
vim.api.nvim_create_autocmd({"LspAttach"}, {
    pattern = {"*.c", "*.h"},
    callback = function(args)
        local buf = args.buf
        local client_id = args.data.client_id
        local client = vim.lsp.get_client_by_id(client_id)

        if client.name ~= "clangd" then
            return
        end

        for dir in vim.fs.parents(vim.api.nvim_buf_get_name(buf)) do
            local compdb = vim.fs.joinpath(dir, "compile_commands.json")

            if vim.fn.filereadable(compdb) == 1 then
                -- Found compile_commands.json then let clangd use it
                return
            end
        end

        -- Didn't find compile_commands.json, disable clangd for the buffer
        vim.lsp.buf_detach_client(buf, client_id)
    end,
})
