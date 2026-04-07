return {
  'lewis6991/gitsigns.nvim',
  config = function()
    require('gitsigns').setup({
      on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        vim.keymap.set('n', ']c', gs.next_hunk, { buffer = bufnr })
        vim.keymap.set('n', '[c', gs.prev_hunk, { buffer = bufnr })
		vim.keymap.set('n', '<leader>hp', require('gitsigns').preview_hunk)
      end,
    })
  end,
}
