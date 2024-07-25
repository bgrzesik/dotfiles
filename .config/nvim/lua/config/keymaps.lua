vim.keymap.set({ "n", "v", "s", "o" }, "<Up>", "<NOP>")
vim.keymap.set({ "n", "v", "s", "o" }, "<Down>", "<NOP>")
vim.keymap.set({ "n", "v", "s", "o" }, "<Right>", "<NOP>")
vim.keymap.set({ "n", "v", "s", "o" }, "<Left>", "<NOP>")
vim.keymap.set({ "n", "v", "s", "o" }, "Q", "<NOP>")
vim.keymap.set({ "n", "v", "s", "o" }, "q:", "<NOP>")

vim.keymap.set({ "n", "v" }, "<C-f>", function()
    LazyVim.format({ force = true })
end)

