require("hop").setup()
vim.keymap.set("n", "<leader>h", "<cmd>lua require'hop'.hint_words()<cr>")
vim.keymap.set("n", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")
vim.keymap.set("v", "<leader>h", "<cmd>lua require'hop'.hint_char2()<cr>")
vim.keymap.set("v", "<leader>l", "<cmd>lua require'hop'.hint_lines()<cr>")

vim.cmd("hi HopNextKey guifg=#ff9900")
vim.cmd("hi HopNextKey1 guifg=#ff9900")
vim.cmd("hi HopNextKey2 guifg=#ff9900")
