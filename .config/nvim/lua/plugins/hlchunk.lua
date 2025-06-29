-- plugin can highlight the indent line, and highlight the code chunk according to the current cursor position
return {
  "shellRaining/hlchunk.nvim",
  version = "^1.3.0",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        -- NOTE: It is useful but sumtimes couses rendering freezes
        enable = false,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = "─",
        },
        style = {
          "#494949",
        },
      },
      indent = {
        enable = true,
        style = {
          "#303030",
        },
      },
      blank = {
        enable = false,
      },
      line_num = {
        enable = false,
      },
    })
  end,
}
