-- highlight and search for todo comments like TODO, HACK, BUG in code
return {
  "folke/todo-comments.nvim",
  version = "^1.5.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  opts = {
    highlight = {
      before = "",
      keyword = "",
      after = "",
    },
  },
}
