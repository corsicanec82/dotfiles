-- notification manager
return {
  "rcarriga/nvim-notify",
  version = "^3.15.0",
  config = function()
    vim.notify = require("notify")

    vim.notify.setup({
      background_colour = "#000000",
      on_open = function(win)
		vim.api.nvim_win_set_config(win, { focusable = false })
	  end,
    })
  end,
}
