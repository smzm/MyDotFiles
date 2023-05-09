return {
    -- mason.nvim
    {
        'williamboman/mason.nvim',
        build = ':MasonUpdate',
        cmd = 'Mason',
        opts = {
            ui = {
                icons = {
                    package_installed = '✓',
                    package_pending = '➜',
                    package_uninstalled = '✗',
                },
            },
        },
    },


    -- null-ls.nvim
    {
        'jose-elias-alvarez/null-ls.nvim',
        dependencies = {
          "nvim-lua/plenary.nvim",
          'williamboman/mason.nvim',
        },
        event = {
            'BufReadPre',
            'BufNewFile',
        },
        opts = function()
            local nls = require('null-ls')
            return {
                sources = {
                    nls.builtins.formatting.stylua,
                    nls.builtins.formatting.markdownlint,
                    nls.builtins.diagnostics.markdownlint,
                }
            }
        end,
    },


    -- nvim-lspconfig
    {
      'neovim/nvim-lspconfig',
      dependencies = {
          'williamboman/mason.nvim',
          'williamboman/mason-lspconfig.nvim',
          'jayp0521/mason-null-ls.nvim',
          "SmiteshP/nvim-navic",
      },
      keys = {
          { 'gd', '<cmd>Telescope lsp_definitions<cr>', desc = 'Goto Definition' },
          { 'gr', '<cmd>Telescope lsp_references<cr>', desc = 'References' },
          { 'gD', vim.lsp.buf.declaration, desc = 'Goto Declaration' },
          { 'gI', '<cmd>Telescope lsp_implementations<cr>', desc = 'Goto Implementation' },
          { 'gy', '<cmd>Telescope lsp_type_definitions<cr>', desc = 'Goto T[y]pe Definition' },
          { 'K', vim.lsp.buf.hover, desc = 'Hover' },
          { 'gK', vim.lsp.buf.signature_help, desc = 'Signature Help' },
      },
      event = {
          'BufReadPre',
          'BufNewFile'
      },
      config = function()
          local lsp_servers = {
            'lua_ls',
            'clangd',
            'marksman',
            'pylsp',
            'dockerls',
            'docker_compose_language_service',
            'cssls',
            'tailwindcss',
            'emmet_ls',
            'html',
            'jsonls',
            'tsserver',
            'taplo',
          }

        -- Mason config
        local mason = require('mason')
        mason.setup()

        local mason_lspconfig = require('mason-lspconfig')
        mason_lspconfig.setup({
          -- list of servers for mason to install
          ensure_installed = lsp_servers,
          -- auto-install configured servers (with lspconfig)
          automatic_installation = true, -- not the same as ensure_installed
        })

        local mason_null_ls = require('mason-null-ls')
        mason_null_ls.setup({
          ensure_installed = {
            'eslint_d', -- ts/js linter
            'prettierd', -- ts/js formatter
            'stylua', -- lua formatter
          },
          -- auto-install configured formatters & linters (with null-ls)
          automatic_installation = true,
        })



        -- LSPConfig
        local lspconfig = require('lspconfig')
        local navic = require('nvim-navic')

        local on_attach = function(client, bufnr)
            navic.attach(client, bufnr)
        end

        local cmp_nvim_lsp = require('cmp_nvim_lsp')
        -- used to enable autocompletion (assign to every lsp server config)
        local capabilities = cmp_nvim_lsp.default_capabilities()



        -- -- ==> Show diagnostic windows on hover :
        -- vim.diagnostic.config({
        --    virtual_text = false
        -- })
        -- -- Show line diagnostics automatically in hover window
        -- vim.o.updatetime = 250
        -- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


        -- ==> Show diagnostic inline text :
        vim.diagnostic.config({
          virtual_text = {
            prefix = '●', -- Could be '■', '▎', 'x'
          },
          severity_sort = true,
          float = {
            source = "always",  -- Or "if_many"
          },
          update_in_insert = false,
        })

        -- Show Signs instead of letters : to affect disable lsp-lines.lua
        local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
        for type, icon in pairs(signs) do
          local hl = "DiagnosticSign" .. type
          vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
        end




        for _, server in pairs(lsp_servers) do

          if server == 'lua_ls' then
            -- configure lua server (with special settings)
            lspconfig[server].setup({
              capabilities = capabilities,
              on_attach = on_attach,
              settings = { -- custom settings for lua
                Lua = {
                  -- make the language server recognize 'vim' global
                  diagnostics = {
                      globals = { 'vim' },
                  },
                  workspace = {
                    -- make language server aware of runtime files
                    library = {
                      [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                      [vim.fn.stdpath('config') .. '/lua'] = true,
                    },
                  },
                  telemetry = {
                    enable = false,
                  },
                },
              },
            })

          else
            lspconfig[server].setup({
              capabilities = capabilities,
              on_attach = on_attach,
            })
          end
        end
      end
    }
}
