-- showing Git diff signs in the gutter and allowing various Git-related actions like staging, undoing, and viewing diffs
return {
  "lewis6991/gitsigns.nvim",
  version = "^1.0.2",
  config = function()
    require("gitsigns").setup({
      on_attach = function(bufnr)
        local gitsigns = require('gitsigns')

        local function map(mode, l, r, opts)
          opts = opts or {}
          -- opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal({']c', bang = true})
          else
            gitsigns.nav_hunk('next')
          end
        end, { desc = 'next hunk' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal({'[c', bang = true})
          else
            gitsigns.nav_hunk('prev')
          end
        end, { desc = 'previous hunk' })

        -- Actions
        map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'stage hunk' })
        map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'reset hunk' })

        map('v', '<leader>hs', function()
          gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'stage hunk' })

        map('v', '<leader>hr', function()
          gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
        end, { desc = 'reset hunk' })

        map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'stage file' })
        map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'reset file' })
        map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'preview hunk' })
        map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'preview hunk (inline)' })

        map('n', '<leader>hb', function()
          gitsigns.blame_line({ full = true })
        end, { desc = 'blame line' })

        map('n', '<leader>hd', gitsigns.diffthis, { desc = 'diff file' })

        map('n', '<leader>hD', function()
          gitsigns.diffthis('~')
        end, { desc = 'diff file ~' })

        map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'quickfix list (all)' })
        map('n', '<leader>hq', gitsigns.setqflist, { desc = 'quickfix list' })

        -- Toggles
        map('n', '<leader>tb', gitsigns.toggle_current_line_blame, { desc = 'toggle line blame' })
        map('n', '<leader>td', gitsigns.toggle_deleted, { desc = 'toggle visibility of deleted lines' })
        map('n', '<leader>tw', gitsigns.toggle_word_diff, { desc = 'toggle visibility of word diffs' })

        -- Text object
        map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'select hunk' })

        -- Custom keymaps
        map('n', '<leader>hc', function()
          if vim.wo.diff then
            vim.cmd('wincmd p | q')
          end
        end, { desc = 'close diff' })
      end
    })
  end,
}
