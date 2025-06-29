-- buffer line with tabpage integration
return {
  "akinsho/bufferline.nvim",
  version = "^4.9.1",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("bufferline").setup({
      options = {
        separator_style = "thin",
        offsets = {
          {
            filetype = "NvimTree",
            text = "File Explorer",
            separator = true,
            text_align = "center",
          },
        },
        -- diagnostics = "nvim_lsp",
      },
    })
  end,
}
