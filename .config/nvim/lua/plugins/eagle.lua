return {
  "soulis-1256/eagle.nvim",
  config = function()
    vim.o.mousemoveevent = true

    require("eagle").setup({
      keyboard_mode = true,
    })

    vim.keymap.set('n', '<leader>sd', ':EagleWin<CR>', { noremap = true, silent = true, desc = 'show diagnostic' })
  end,
}
