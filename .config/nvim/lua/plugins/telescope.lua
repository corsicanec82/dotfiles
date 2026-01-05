-- plugin for fuzzy finder anywhere
return {
  "nvim-telescope/telescope.nvim",
  version = "^0.2.1",
  dependencies = {
    "nvim-lua/plenary.nvim"
  },
  config = function()
    local builtin = require("telescope.builtin")
    local telescope = require("telescope")

    telescope.load_extension("notify")

    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = "Live Grep" })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Find Help tags" })
    vim.keymap.set('n', '<leader>fn', function() telescope.extensions.notify.notify() end,
      { desc = "Find notifications" })
  end
}
