-- nvim-web-devicons needs patched nerd font
-- https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/RobotoMono/Regular/RobotoMonoNerdFont-Regular.ttf

local function expand_tree_on_file()
  local api = require("nvim-tree.api")

  if api.tree.is_visible() then
    api.tree.find_file({ open = true })
  end
end

local function custom_toggle()
  local api = require("nvim-tree.api")

  api.tree.toggle({ focus = false })
  expand_tree_on_file()
end

local function custom_tree_on_attach(bufnr)
  local api = require("nvim-tree.api")

  local function opts(desc)
    return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set("n", "<M-f>", api.live_filter.start, opts('Live Filter: Start'))
  vim.keymap.set("n", "f", "", opts("Remaped to <M-f>"))
  vim.keymap.set("n", "<C-n>", api.tree.open, { desc = "Tree open" })
  vim.keymap.set("n", "<C-k>b", custom_toggle, { desc = "Tree toggle" })
  vim.keymap.set("n", "<C-k>c", api.tree.collapse_all, { desc = "Tree collapse all" })
end

return {
  "nvim-tree/nvim-tree.lua",
  version = "^1.14.0",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    -- disable netrw at the very start of your init.lua
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    local api = require("nvim-tree.api")

    require("nvim-tree").setup({
      on_attach = custom_tree_on_attach,
      git = {
        enable = true,
      },
      view = {
        width = 34,
      },
      filters = {
        git_ignored = false,
        custom = {
          "^.git$",
        },
      },
    })

    -- open tree when argument is passed
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() > 0 then
          api.tree.open()
          -- if argument is a file set focus on it
          if vim.fn.filereadable(vim.fn.argv(0)) == 1 then
            vim.cmd("wincmd l")
            expand_tree_on_file()
          end
        end
      end,
    })

    -- expand tree on file when bufer is focused
    vim.api.nvim_create_autocmd("BufEnter", {
      callback = expand_tree_on_file,
    })

    -- open tree if we open something from dashboard
    vim.api.nvim_create_autocmd("BufLeave", {
      callback = function()
        if vim.bo.filetype == "dashboard" and not api.tree.is_visible() then
          api.tree.toggle({ focus = false })
        end
      end,
    })

    -- for using by other plugins
    vim.tree_custom_toggle = custom_toggle
  end,
}
