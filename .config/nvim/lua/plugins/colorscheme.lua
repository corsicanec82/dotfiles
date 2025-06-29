-- colorscheme like in vscode
return {
  "Mofiqul/vscode.nvim",
  config = function()
    require('vscode').setup({
      terminal_colors = false,
    })

    vim.cmd.colorscheme("vscode")
    -- vim.g.gitblame_highlight_group = "gitcommitComment"
    vim.api.nvim_set_hl(0, "GitBlameColor", {
      fg = vim.api.nvim_get_hl(0, { name = "gitcommitComment" }).fg,
      italic = true,
    })
  end,
}
