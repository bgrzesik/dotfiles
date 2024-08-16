-- C exrc file

-- Use kernel style formatting and improve gf slightly
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = {"*.c", "*.h"},
    callback = function(args)
        local buf = args.buf
        local cwd = vim.fn.getcwd()

        -- Kernel style formatting
        vim.opt_local.tabstop = 8
        vim.opt_local.shiftwidth = 8
        vim.opt_local.expandtab = false

        local include_path = {
            ".",
            "src",
            "include",
        }

        -- Scan parent directories for include directories and them to path
        -- until reach current directory
        for dir in vim.fs.parents(vim.api.nvim_buf_get_name(buf)) do
            if dir == cwd then
                -- Quit until we go too far
                break
            end

            local inc = vim.fs.joinpath(dir, "include")

            if vim.fn.isdirectory(inc) ~= 0 then
                table.insert(include_path, inc)
            end
        end

        vim.opt_local.path = vim.tbl_deep_extend(
            "keep",
            {},
            vim.opt_local.path,
            include_path
        )
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

            if vim.fn.filereadable(compdb) ~= 0 then
                -- Found compile_commands.json then let clangd use it
                return
            end
        end

        -- Didn't find compile_commands.json, disable clangd for the buffer
        client.stop()
    end,
})

local exrc2_path = vim.fs.joinpath(vim.fn.getcwd(), ".nvim2.lua")
if vim.secure.read(exrc2_path) ~= nil then
    package.path = package.path .. ";" .. exrc2_path
    require(".nvim2.lua")
end