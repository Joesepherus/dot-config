vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50


vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Function to toggle nvim-tree and set focus
vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })


-- Function to toggle nvim-tree and set focus
vim.api.nvim_set_keymap('n', '<C-;>', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })

-- Function to switch focus back to file window from nvim-tree
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { noremap = true, silent = true })

-- Function to switch focus back to file window from nvim-tree
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { noremap = true, silent = true })


-- Function to toggle comment
function ToggleComment()
  local line = vim.api.nvim_get_current_line()
  if line:sub(1, 2) == "//" then
    -- Uncomment the line
    vim.api.nvim_set_current_line(line:sub(3))
  else
    -- Comment the line
    vim.api.nvim_set_current_line("//" .. line)
  end
end

-- Map Ctrl+/ to the ToggleComment function in normal and visual modes
vim.api.nvim_set_keymap('n', '<C-/>', ':lua ToggleComment()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<C-/>', '<Esc>:lua ToggleComment()<CR>gv', { noremap = true, silent = true })


-- Remap <leader>w to write the file
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
-- Remap <leader>q to quit the file
vim.api.nvim_set_keymap('n', '<leader>q', ':q<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>qq', ':qa!<CR>', { noremap = true, silent = true })

-- Map Enter to add a new line below the current line
vim.api.nvim_set_keymap('n', '<CR>', 'o<Esc>', { noremap = true, silent = true })

-- Map Shift+Alt+Enter to add a new line above the current line
vim.api.nvim_set_keymap('n', '<S-CR>', 'O<Esc>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>ff', ':lua require"telescope.builtin".find_files({ hidden = true })<CR>',
  { noremap = true, silent = true })



vim.api.nvim_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.format()<CR>', { noremap = true, silent = true })


-- Map <leader>k to show diagnostics in a floating window
vim.api.nvim_set_keymap(
  'n',
  '<leader>e',
  '<cmd>lua vim.diagnostic.open_float()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap('n', '<leader>pb', "<cmd>Telescope buffers<cr>", { noremap = true, silent = true })

vim.opt.wrap = true