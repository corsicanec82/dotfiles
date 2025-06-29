-- plugin to persist and toggle multiple terminals during an editing session
return {
  "akinsho/toggleterm.nvim",
  version = "^2.13.1",
  opts = {
    open_mapping = [[<C-t>]],
    direction = "float",
    shade_terminals = false,
  },
}
