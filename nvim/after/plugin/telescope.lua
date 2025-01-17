local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

require('telescope').setup({
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case',
    },
    file_ignore_patterns = {
      "node_modules/",
      "public/libs",
    },
    mappings = {
      i = {
        ["<C-d>"] = require('telescope.actions').delete_buffer
      },
      n = {
        ["<C-d>"] = require('telescope.actions').delete_buffer
      }
    }
  },
})
