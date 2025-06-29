-- Base settings
vim.o.termguicolors = true
vim.o.number = true
vim.o.signcolumn = "yes:1"
vim.o.ignorecase = true
vim.o.wrap = false

-- timeout for keymaps
vim.o.timeout = true
vim.o.timeoutlen = 300


-- Inore provider warnings
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- Using system clipboard
vim.opt.clipboard:append("unnamedplus")

-- Removing tilda sign from empty rows
vim.opt.fillchars = { stl = "*", eob = " " }


-- Indentation
vim.opt.autoindent = false
vim.opt.smartindent = false

vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true


-- Custom file types
vim.api.nvim_create_augroup("CustomFileTypes", { clear = true })

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.tf",
  command = "set filetype=terraform",
  group = "CustomFileTypes",
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = ".envrc",
  command = "set filetype=sh",
  group = "CustomFileTypes",
})

-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   pattern = "Caddyfile",
--   command = "set filetype=caddy",
--   group = "CustomFileTypes",
-- })


-- NOTE: By default the following keymap is <C-w>d
vim.keymap.set("n", "<Esc><Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search selection" })


-- keymaps for buffers management
vim.keymap.set("n", "<leader>bn", function() vim.cmd("bnext") end, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", function() vim.cmd("bprevious") end, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", function()
  vim.cmd("bd")
  vim.cmd("bprevious")
end, { desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bl", function()
  local buf_id = vim.fn.bufnr('#')
  local buftype = vim.api.nvim_buf_get_option(buf_id, 'filetype')
  if vim.fn.matchstr(buftype, "NvimTree") == "" then
    vim.cmd("b#")
  end
end, { desc = "Last visited buffer" })


-- keymaps for file saving
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })
vim.keymap.set('i', '<C-s>', '<Esc><cmd>w<cr>a', { desc = 'Save file' })

-- keymaps for editor closing
vim.keymap.set('n', '<C-q>', '<cmd>qa<cr>', { desc = 'Close editor' })
vim.keymap.set('i', '<C-q>', '<Esc><cmd>qa<cr>', { desc = 'Close editor' })
