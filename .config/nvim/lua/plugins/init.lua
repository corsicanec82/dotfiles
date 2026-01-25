-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
  require("plugins.bufferline"),
  require("plugins.codeium"),
  require("plugins.colorscheme"),
  require("plugins.comment"),
  require("plugins.dashboard-nvim"),
  require("plugins.eagle"),
  require("plugins.git-blame"),
  -- require("plugins.github-copilot-chat"),
  -- require("plugins.github-copilot"),
  require("plugins.gitsigns"),
  require("plugins.hlchunk"),
  require("plugins.log-highlight"),
  require("plugins.lsp-format"),
  require("plugins.lualine"),
  require("plugins.luasnip"),
  require("plugins.markdown-preview"),
  require("plugins.mason-lspconfig"),
  require("plugins.mason"),
  require("plugins.maximize"),
  require("plugins.move"),
  require("plugins.neoscroll"),
  require("plugins.noice"),
  require("plugins.nvim-autopairs"),
  require("plugins.nvim-cmp"),
  require("plugins.nvim-lspconfig"),
  require("plugins.nvim-notify"),
  require("plugins.nvim-surround"),
  require("plugins.nvim-tree"),
  require("plugins.nvim-treesitter-context"),
  require("plugins.nvim-treesitter-endwise"),
  require("plugins.nvim-treesitter"),
  require("plugins.nvim-ts-context-commentstring"),
  require("plugins.other"),
  -- -- require("plugins.persistence"),
  require("plugins.telescope"),
  require("plugins.todo-comments"),
  require("plugins.toggleterm"),
  require("plugins.tree-sitter-embedded-template"),
  require("plugins.treesj"),
  require("plugins.trim"),
  require("plugins.trouble"),
  require("plugins.twilight"),
  require("plugins.vim-fugitive"),
  require("plugins.which-key"),
}

-- Setup lazy.nvim
require("lazy").setup(plugins, {
  rocks = { enabled = false },
});
