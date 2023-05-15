return {
	-- mason.nvim
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate",
		cmd = "Mason",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},

	-- null-ls.nvim
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"williamboman/mason.nvim",
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		opts = function()
			local nls = require("null-ls")
			local sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.markdownlint,
				nls.builtins.diagnostics.markdownlint,
				nls.builtins.formatting.fixjson,
				nls.builtins.formatting.isort,
				nls.builtins.formatting.black.with({
					extra_args = { "--line-length=120" },
				}),
			}
			nls.setup({
				sources = sources,
				on_attach = function(client, bufnr)
					-- Enable formatting on sync
					if client.supports_method("textDocument/formatting") then
						local format_on_save = vim.api.nvim_create_augroup("LspFormatting", { clear = true })
						vim.api.nvim_create_autocmd("BufWritePre", {
							group = format_on_save,
							buffer = bufnr,
							callback = function()
								vim.lsp.buf.format({
									bufnr = bufnr,
									filter = function(_client)
										return _client.name == "null-ls"
									end,
								})
							end,
						})
					end
				end,
			})
		end,
	},

	-- nvim-lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"jayp0521/mason-null-ls.nvim",
			"SmiteshP/nvim-navic",
		},
		keys = {
			{ "gd", "<cmd>Telescope lsp_definitions<cr>", desc = "Goto Definition" },
			{ "gr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
			{ "gD", vim.lsp.buf.declaration, desc = "Goto Declaration" },
			{ "gI", "<cmd>Telescope lsp_implementations<cr>", desc = "Goto Implementation" },
			{ "gy", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Goto T[y]pe Definition" },
			{ "K", vim.lsp.buf.hover, desc = "Hover" },
			{ "gK", vim.lsp.buf.signature_help, desc = "Signature Help" },
		},
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		config = function()
			local lsp_servers = {
				"lua_ls",
				"clangd",
				"marksman",
				"pyright",
				"dockerls",
				"docker_compose_language_service",
				"cssls",
				"tailwindcss",
				"emmet_ls",
				"html",
				"jsonls",
				"tsserver",
				"taplo",
			}

			-- Mason config
			local mason = require("mason")
			mason.setup()

			local mason_lspconfig = require("mason-lspconfig")
			mason_lspconfig.setup({
				-- list of servers for mason to install
				ensure_installed = lsp_servers,
				-- auto-install configured servers (with lspconfig)
				automatic_installation = true, -- not the same as ensure_installed
			})

			local mason_null_ls = require("mason-null-ls")
			mason_null_ls.setup({
				ensure_installed = {
					"eslint_d", -- ts/js linter
					"prettierd", -- ts/js formatter
					"stylua", -- lua formatter
				},
				-- auto-install configured formatters & linters (with null-ls)
				automatic_installation = true,
			})

			-- LSPConfig
			local lspconfig = require("lspconfig")
			local navic = require("nvim-navic")

			local on_attach = function(client, bufnr)
				navic.attach(client, bufnr)
			end

			local cmp_nvim_lsp = require("cmp_nvim_lsp")
			-- used to enable autocompletion (assign to every lsp server config)
			local capabilities = cmp_nvim_lsp.default_capabilities()

			-- ==> Show diagnostic windows on hover :
			-- vim.diagnostic.config({
			--    virtual_text = false
			-- })
			-- -- Show line diagnostics automatically in hover window
			-- vim.o.updatetime = 250
			-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]

			-- -- ==> Show diagnostic inline text :
			vim.diagnostic.config({
				virtual_text = true,
				--{
				-- prefix = '●', -- Could be '■', '▎', 'x'
				--},
				severity_sort = true,
				float = {
					source = "always", -- Or "if_many"
				},
				update_in_insert = false,
			})

			-- Show Signs instead of letters : to affect disable lsp-lines.lua
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			vim.api.nvim_set_hl(0, "DiagnosticWarn", { fg = "#52577d", bg = bg })
			vim.api.nvim_set_hl(0, "DiagnosticHint", { fg = "#52577d", bg = bg })
			vim.api.nvim_set_hl(0, "DiagnosticInfo", { fg = "#52577d", bg = bg })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#424561", bg = bg })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#424561", bg = bg })
			vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#e8546a", bg = None })

			for _, server in pairs(lsp_servers) do
				if server == "lua_ls" then
					-- configure lua server (with special settings)
					lspconfig[server].setup({
						capabilities = capabilities,
						on_attach = on_attach,
						settings = { -- custom settings for lua
							Lua = {
								-- make the language server recognize 'vim' global
								diagnostics = {
									globals = { "vim" },
								},
								workspace = {
									-- make language server aware of runtime files
									library = {
										[vim.fn.expand("$VIMRUNTIME/lua")] = true,
										[vim.fn.stdpath("config") .. "/lua"] = true,
									},
								},
								telemetry = {
									enable = false,
								},
							},
						},
					})
				elseif server == "pyright" then
					lspconfig[server].setup({})
				else
					lspconfig[server].setup({
						capabilities = capabilities,
						on_attach = on_attach,
					})
				end
			end
		end,
	},
}
