-- showing available keybindings in a popup
return {
  "folke/which-key.nvim",
  version = "^3.17.0",
  event = "VeryLazy",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "echasnovski/mini.icons",
  },
  opts = {
    delay = function(ctx)
      return ctx.plugin and 0 or 300
    end,
  },
}
