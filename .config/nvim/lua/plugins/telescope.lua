return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    cmd = 'Telescope',
    version = false, -- telescope did only one release, so use HEAD for now
    keys = {
      {
        '<C-p>',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find files within current working directory, respects .gitignore',
      },
      {
        '<leader>,',
        '<cmd>Telescope buffers show_all_buffers=true<cr>',
        desc = 'Switch Buffer',
      },
      {
        '<leader>/',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Find in Files (Grep)',
      },
      {
        '<leader>:',
        '<cmd>Telescope command_history<cr>',
        desc = 'Command History',
      },
      {
        '<leader><space>',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find Files (root dir)',
      },
      -- find
      {
        '<leader>fb',
        '<cmd>Telescope buffers<cr>',
        desc = 'Buffers',
      },
      {
        '<leader>ff',
        function()
          require('telescope.builtin').find_files()
        end,
        desc = 'Find Files (root dir)',
      },
      {
        '<leader>fF',
        function()
          require('telescope.builtin').find_files({ cwd = false })
        end,
        desc = 'Find Files (cwd)',
      },
      {
        '<leader>fr',
        '<cmd>Telescope oldfiles<cr>',
        desc = 'Recent',
      },
      {
        '<leader>fs',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Find text',
      },
      -- git
      {
        '<leader>gc',
        '<cmd>Telescope git_commits<CR>',
        desc = 'commits',
      },
      {
        '<leader>gs',
        '<cmd>Telescope git_status<CR>',
        desc = 'status',
      },
      -- search
      {
        '<leader>sa',
        '<cmd>Telescope autocommands<cr>',
        desc = 'Auto Commands',
      },
      {
        '<leader>sb',
        '<cmd>Telescope current_buffer_fuzzy_find<cr>',
        desc = 'Buffer',
      },
      {
        '<leader>sc',
        '<cmd>Telescope command_history<cr>',
        desc = 'Command History',
      },
      {
        '<leader>sC',
        '<cmd>Telescope commands<cr>',
        desc = 'Commands',
      },
      {
        '<leader>sd',
        '<cmd>Telescope diagnostics<cr>',
        desc = 'Diagnostics',
      },
      {
        '<leader>sg',
        function()
          require('telescope.builtin').live_grep()
        end,
        desc = 'Grep (root dir)',
      },
      {
        '<leader>sG',
        function()
          require('telescope.builtin').live_grep({ cwd = false })
        end,
        desc = 'Grep (cwd)',
      },
      {
        '<leader>sh',
        '<cmd>Telescope help_tags<cr>',
        desc = 'Help Pages',
      },
      {
        '<leader>sH',
        '<cmd>Telescope highlights<cr>',
        desc = 'Search Highlight Groups',
      },
      {
        '<leader>sk',
        '<cmd>Telescope keymaps<cr>',
        desc = 'Key Maps',
      },
      {
        '<leader>sM',
        '<cmd>Telescope man_pages<cr>',
        desc = 'Man Pages',
      },
      {
        '<leader>sm',
        '<cmd>Telescope marks<cr>',
        desc = 'Jump to Mark',
      },
      {
        '<leader>so',
        '<cmd>Telescope vim_options<cr>',
        desc = 'Options',
      },
      {
        '<leader>sR',
        '<cmd>Telescope resume<cr>',
        desc = 'Resume',
      },
      {
        '<leader>sw',
        function()
          require('telescope.builtin').grep_string()
        end,
        desc = 'Word (root dir)',
      },
      {
        '<leader>sW',
        function()
          require('telescope.builtin').grep_string({ cwd = false })
        end,
        desc = 'Word (cwd)',
      },
      {
        '<leader>uC',
        function()
          require('telescope.builtin').colorscheme({ enable_preview = true })
        end,
        desc = 'Colorscheme with preview',
      },
      {
        '<leader>ss',
        function()
          require('telescope.builtin').lsp_document_symbols({
            symbols = {
              'Class',
              'Function',
              'Method',
              'Constructor',
              'Interface',
              'Module',
              'Struct',
              'Trait',
              'Field',
              'Property',
            },
          })
        end,
        desc = 'Goto Symbol',
      },
      {
        '<leader>sS',
        function()
          require('telescope.builtin').lsp_workspace_symbols({
            symbols = {
              'Class',
              'Function',
              'Method',
              'Constructor',
              'Interface',
              'Module',
              'Struct',
              'Trait',
              'Field',
              'Property',
            },
          })
        end,
        desc = 'Goto Symbol (Workspace)',
      },
    },
    opts = {
      defaults = {
        file_ignore_patterns = { '.git/', 'node_modules' },
        prompt_prefix = ' ',
        selection_caret = ' ',
        mappings = {
          i = {
            ['<c-t>'] = function(...)
              return require('trouble.providers.telescope').open_with_trouble(...)
            end,
            ['<a-i>'] = function()
              require('telescope.builtin').find_files({ no_ignore = true })
            end,
            ['<a-h>'] = function()
              require('telescope.builtin').find_files({ hidden = true })
            end,
            ['<C-Down>'] = function(...)
              return require('telescope.actions').cycle_history_next(...)
            end,
            ['<C-Up>'] = function(...)
              return require('telescope.actions').cycle_history_prev(...)
            end,
            ['<C-f>'] = function(...)
              return require('telescope.actions').preview_scrolling_down(...)
            end,
            ['<C-b>'] = function(...)
              return require('telescope.actions').preview_scrolling_up(...)
            end,
          },
          n = {
            ['q'] = function(...)
              return require('telescope.actions').close(...)
            end,
          },
        },
      },
    },
}
