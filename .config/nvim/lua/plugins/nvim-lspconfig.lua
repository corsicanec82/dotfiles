-- provides easy configurations for setting up built-in LSP
return {
  "neovim/nvim-lspconfig",
  version = "^2.3.0",
  dependencies = {
    "lukas-reineke/lsp-format.nvim",
    -- "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    local util = require("lspconfig.util")
    local lspconfig = require("lspconfig")
    local lsp_format = require("lsp-format")
    local capabilities = require('cmp_nvim_lsp').default_capabilities()

    -- npm install -g typescript typescript-language-server
    lspconfig.ts_ls.setup({ capabilities = capabilities })

    -- npm install -g @biomejs/biome
    lspconfig.biome.setup({ on_attach = lsp_format.on_attach, capabilities = capabilities })

    -- mise use --global lua-language-server@3.15.0
    lspconfig.lua_ls.setup({
      on_attach = lsp_format.on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
        },
      },
    })

    -- rustup component add rust-analyzer
    lspconfig.rust_analyzer.setup({
      on_attach = lsp_format.on_attach,
      capabilities = capabilities,
      settings = {
        ["rust-analyzer"] = {
          diagnostics = {
            experimental = { enable = true },
            styleLints = { enable = true },
          },
        },
      },
    })

    -- gem install ruby-lsp
    lspconfig.ruby_lsp.setup({
      on_attach = lsp_format.on_attach,
      capabilities = capabilities
    })

    -- gem install sorbet
    lspconfig.sorbet.setup({
      root_dir = util.root_pattern("sorbet/config"),
      capabilities = capabilities,
    })

    -- sorbet lsp doesn't provide source
    vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx, config)
      local client_name = vim.lsp.get_client_by_id(ctx.client_id).name

      if client_name == "sorbet" then
        for _, diagnostic in ipairs(result.diagnostics) do
          diagnostic.source = client_name
        end
      end

      vim.lsp.diagnostic.on_publish_diagnostics(_, result, ctx, config)
    end

    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename symbol" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { noremap = true, silent = true, desc = "Go to definition" })
  end,
}
