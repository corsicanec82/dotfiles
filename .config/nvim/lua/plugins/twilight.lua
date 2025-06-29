-- dims inactive portions of the code you're editing
return {
  "folke/twilight.nvim",
  config = function()
    local twilight = require("twilight")
    
    twilight.setup({
      context = 14,
      treesitter = true,
    })

    vim.keymap.set('n', '<leader>tw', function() twilight.toggle() end, { desc = 'Toggle Twilight' })
  end
}
