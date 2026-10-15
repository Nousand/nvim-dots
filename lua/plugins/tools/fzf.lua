return {
  'ibhagwan/fzf-lua',
  -- Optional dependency for file icons
  dependencies = { 'nvim-tree/nvim-web-devicons', lazy = false, config = true },
  config = function()
    local fzf = require('fzf-lua')
    fzf_colors = true

    -- Basic setup with a clean floating window layout
    fzf.setup({
      'default-title',
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = 'rounded',
      },
      keymap = {
        fzf = {
          ['ctrl-q'] = 'select-all+accept', -- Send all results to quickfix list
        },
      },
    })

    -- Essential Keymaps
    local keymap = vim.keymap.set
    local opts = { noremap = true, silent = true }

    keymap('n', '<leader>ff', fzf.files, vim.tbl_extend('force', opts, { desc = 'FZF Find Files' }))
    keymap('n', '<leader>fg', fzf.live_grep, vim.tbl_extend('force', opts, { desc = 'FZF Live Grep' }))
    keymap('n', '<leader>fb', fzf.buffers, vim.tbl_extend('force', opts, { desc = 'FZF Buffers' }))
    keymap('n', '<leader>fh', fzf.help_tags, vim.tbl_extend('force', opts, { desc = 'FZF Help Tags' }))
    keymap('n', '<leader>fr', fzf.oldfiles, vim.tbl_extend('force', opts, { desc = 'FZF Recent Files' }))
    keymap('n', '<leader>fx', fzf.quickfix, vim.tbl_extend('force', opts, { desc = 'FZF Quickfixes' }))
    keymap('n', '<leader>ft', "<cmd>TodoFzfLua<cr>" , vim.tbl_extend('force', opts, { desc = 'FZF Todos' }))
    -- TODO: Add lsp support
  end,
}
