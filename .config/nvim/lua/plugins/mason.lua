-- plugin that manages external tools like LSP servers, DAP servers, linters, and formatters
return {
  "williamboman/mason.nvim",
  version = "^1.11.0",
  config = function()
    require("mason").setup({})
  end,
}
