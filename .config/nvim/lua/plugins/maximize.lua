-- maximize window
return {
  "declancm/maximize.nvim",
  dependencies = {
    "nvim-tree/nvim-tree.lua",
  },
  config = function()
    require("maximize").setup({
      plugins = {
        tree = { enable = true },
      },
    })

    vim.keymap.set("n", "<C-k>m", ":Maximize<CR>", { noremap = true, silent = true, desc = "Toggle maximizing window" })
  end,
}
