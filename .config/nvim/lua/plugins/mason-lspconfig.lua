-- bridge between mason.nvim and nvim-lspconfig, automating the setup of LSP servers installed via Mason, ensuring seamless integration
return {
  "williamboman/mason-lspconfig.nvim",
  version = "^2.1.0",
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = {
        -- "ts_ls",
        -- "biome",
        -- "lua_ls",
        -- "rust_analyzer",
        -- "ruby_lsp",
        -- "sorbet",
      },
    })
  end,
}
