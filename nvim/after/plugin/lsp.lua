local lsp = require('lsp-zero')
require('lspconfig').intelephense.setup({})

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = { 'ts_ls', 'rust_analyzer', 'html', 'cssls', 'solidity_ls' },
  handlers = {
    lsp.default_setup,
    lua_ls = function()
      local lua_opts = lsp.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

lsp.preset("recommended")

local cmp = require('cmp')

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
  ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.confirm({ select = true }),
  ['<Enter>'] = cmp.mapping.confirm({ select = true }),
  ['<C-Space>'] = cmp.mapping.complete(),
})
cmp.setup {
  mapping = cmp_mappings,
  sources = cmp.config.sources({
    { name = 'nvim_lsp' }, -- LSP completions
    { name = 'luasnip' },  -- Snippet completions
    { name = 'path' },     -- File path completions
    { name = 'buffer' },   -- Buffer completions
  })
}
lsp.set_preferences({
  sign_icons = {}
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "gb", function() vim.cmd('normal! `<C-o>') end, opts)
  vim.keymap.set("n", "gp", function() vim.lsp.buf.references() end, opts)
end)

lsp.setup()
