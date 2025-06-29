-- plugin provides syntax parsing using Tree-sitter for improved syntax highlighting, code navigation, and better code understanding
return {
  "nvim-treesitter/nvim-treesitter",
  version = "^0.9.3",
  build = ":TSUpdate",
  config = function()
    -- TODO: don't work. mayy be problem with this parser
    -- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
    -- parser_config.caddy = {
    --   install_info = {
    --     url = "https://github.com/opa-oz/tree-sitter-caddy",
    --     files = { "src/parser.c", "src/scanner.c" },
    --     branch = "main",
    --   },
    --   filetype = "caddy",
    -- }

    require("nvim-treesitter.configs").setup({
      ensure_installed = { "regex", "vim", "lua", "markdown", "markdown_inline", "bash" },
      auto_install = true,
      highlight = {
        enable = true,
        disable = { "dockerfile" },
      },
      indent = { enable = true },
      endwise = { enable = true },
    })
  end,
}
