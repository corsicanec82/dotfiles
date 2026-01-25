-- plugin for showing alternate files
return {
  "rgroli/other.nvim",
  config = function()
    require("other-nvim").setup({
      mappings = {
        "rails",
        "react",
        {
          pattern = "app/controllers/(.*)_controller.rb",
          target = {
            { context = "view", target = "app/javascript/pages/%1/*.tsx" },
            { context = "view", target = "app/javascript/pages/%1/*.jsx" },
          }
        },
        {
          pattern = "test/controllers/(.*)_controller_test.rb",
          target = {
            { context = "view", target = "app/javascript/pages/%1/*.tsx" },
          }
        },
        {
          pattern = "app/javascript/pages/(.*)/(.*).[tj]sx",
          target = {
            { context = "controller", target = "app/controllers/%1_controller.rb" },
            { context = "test",       target = "test/controllers/%1_controller_test.rb" },
          }
        },
        {
          pattern = "app/models/(.*).rb",
          target = {
            { context = "fixture", target = "test/fixtures/%1.yml", transformer = "pluralize" },
            { context = "factory", target = "test/factories/%1.rb", transformer = "pluralize" },
          }
        },
        {
          pattern = "test/fixtures/(.*).yml",
          target = {
            { context = "model",   target = "app/models/%1.rb",       transformer = "singularize" },
            { context = "factory", target = "test/factories/%1.rb" },
            { context = "test",    target = "test/models/%1_test.rb", transformer = "singularize" },
          }
        },
        {
          pattern = "test/factories/(.*).rb",
          target = {
            { context = "model",   target = "app/models/%1.rb",       transformer = "singularize" },
            { context = "fixture", target = "test/fixtures/%1.yml" },
            { context = "test",    target = "test/models/%1_test.rb", transformer = "singularize" },
          }
        },
        {
          pattern = "test/models/(.*)_test.rb",
          target = {
            { context = "fixture", target = "test/fixtures/%1.yml", transformer = "pluralize" },
            { context = "factory", target = "test/factories/%1.rb", transformer = "pluralize" },
          }
        },
        {
          pattern = "app/services/(.*)_service.rb",
          target = {
            { context = "fixture", target = "test/fixtures/%1.yml",            transformer = "pluralize" },
            { context = "factory", target = "test/factories/%1.rb",            transformer = "pluralize" },
            { context = "test",    target = "test/services/%1_service_test.rb" },
          }
        },
        {
          pattern = "test/services/(.*)_service_test.rb",
          target = {
            { context = "fixture", target = "test/fixtures/%1.yml", transformer = "pluralize" },
            { context = "factory", target = "test/factories/%1.rb", transformer = "pluralize" },
          }
        }
      },
      showMissingFiles = false,
      rememberBuffers = false,
      style = {
        border = "rounded",
      }
    })

    vim.keymap.set('n', '<leader>fa', "<cmd>:Other<CR>", { desc = "Show alternatives", noremap = true, silent = true })
    vim.keymap.set('n', '<M-r>', "<cmd>:Other<CR>", { desc = "Show alternatives", noremap = true, silent = true })
  end
}
