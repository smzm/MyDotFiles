return {
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{
		"baliestri/aura-theme",
		lazy = false,
		priority = 1000,
		config = function(plugin)
			vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
			vim.cmd([[colorscheme aura-dark]])
		end,
	},
}

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {
-- 		style = "moon",
-- 		transparent = false,
-- 		lualine_bold = true,
-- 		terminal_colors = true,
-- 		on_highlights = function(hl, c)
-- 			local prompt = "#2d3149"
-- 			hl.TelescopeNormal = {
-- 				bg = c.bg_dark,
-- 				fg = c.fg_dark,
-- 			}
-- 			hl.TelescopeBorder = {
-- 				bg = c.bg_dark,
-- 				fg = c.bg_dark,
-- 			}
-- 			hl.TelescopePromptNormal = {
-- 				bg = prompt,
-- 			}
-- 			hl.TelescopePromptBorder = {
-- 				bg = prompt,
-- 				fg = prompt,
-- 			}
-- 			hl.TelescopePromptTitle = {
-- 				bg = prompt,
-- 				fg = prompt,
-- 			}
-- 			hl.TelescopePreviewTitle = {
-- 				bg = c.bg_dark,
-- 				fg = c.bg_dark,
-- 			}
-- 			hl.TelescopeResultsTitle = {
-- 				bg = c.bg_dark,
-- 				fg = c.bg_dark,
-- 			}
-- 			hl.DiagnosticVirtualTextWarn = {
-- 				bg = "NONE",
-- 			}
-- 			-- hl.DiagnosticVirtualTextError = {
-- 			--   bg = "NONE"
-- 			-- }
-- 			hl.DiagnosticVirtualTextHint = {
-- 				bg = "NONE",
-- 			}
-- 			hl.DiagnosticVirtualTextInfo = {
-- 				bg = "NONE",
-- 			}
-- 			hl.CopilotSuggestion = {
-- 				bg = "NONE",
-- 				fg = "#666985",
-- 			}
-- 		end,
-- 	},
-- 	config = function(_, opts)
-- 		local tokyonight = require("tokyonight")
-- 		tokyonight.setup(opts)
-- 		tokyonight.load()
-- 	end,
-- }
