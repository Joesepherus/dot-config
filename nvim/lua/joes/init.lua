require("joes.remap")
require("joes.set")
require("joes.packer")

--vim.cmd([[
--  augroup SolidityAbbreviations
--    autocmd!
--    autocmd FileType solidity setlocal complete+=k~/.config/nvim/lua/joes/keywords.txt
--  augroup END
--]])

--vim.api.nvim_create_autocmd("BufWritePre", {
--  pattern = "*",
--  callback = function()
--    vim.lsp.buf.format({ async = false })
--  end,
--})
--
