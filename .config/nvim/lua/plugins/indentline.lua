return {
  {
    'lukas-reineke/indent-blankline.nvim',
    event = { 'BufReadPost', 'BufNewFile' },
    opts = {
      char = '│',
      filetype_exclude = {
        'help',
        'alpha',
        'dashboard',
        'NvimTree',
        'Trouble',
        'lazy',
        'TelescopePrompt',
        'text',
        'toggleterm',
      },
      show_trailing_blankline_indent = false,
      show_current_context = false,
      context_highlight_list = { 'SpecialKey', 'Operator', 'Statement' },
    },
  },
  {
    'echasnovski/mini.indentscope',
    version = false, -- wait till new 0.7.0 release to put it back on semver
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      symbol = '│',
      options = { try_as_border = true },
    },
    init = function()
      vim.api.nvim_create_autocmd('FileType', {
        pattern = { 'help', 'alpha', 'dashboard', 'NvimTree', 'Trouble', 'lazy', 'mason' },
        callback = function()
          vim.b.miniindentscope_disable = true
        end,
      })
    end,
    config = function(_, opts)
      require('mini.indentscope').setup(opts)
    end,
  }
}



-- Indent Line with another configuration
-- return {
--     'lukas-reineke/indent-blankline.nvim',
--     event = {
--         'BufReadPost',
--         'BufNewFile',
--     },
--     opts = {
--         char = '▏',
--         context_char = '▏',
--         use_treesitter = true,
--         show_first_indent_level = true,
--         show_trailing_blankline_indent = false,
--         show_current_context = true,
--         show_current_context_start = true,
--         filetype_exclude = {
--             'help',
--             'NvimTree',
--             'dashboard',
--             'Trouble',
--             'neogitstatus',
--         },
--         context_patterns = {
--             'class',
--             'return',
--             'function',
--             'method',
--             '^if',
--             '^while',
--             'jsx_element',
--             '^for',
--             '^object',
--             '^table',
--             'block',
--             'arguments',
--             'if_statement',
--             'else_clause',
--             'jsx_element',
--             'jsx_self_closing_element',
--             'try_statement',
--             'catch_clause',
--             'import_statement',
--             'operation_type',
--         },
--     },
-- }



