-- plugin provides easy and flexible commenting functionality for code
return {
  "numToStr/Comment.nvim",
  version = "^0.8.0",
  config = function()
    require('Comment').setup({
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })
  end,
}
