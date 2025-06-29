-- git blame plugin
return {
  "f-person/git-blame.nvim",
  opts = {
    -- don't display virtual text beacuse of integration with lualine
    display_virtual_text = 0,
  },
}
