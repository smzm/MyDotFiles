return {
	"nvim-lualine/lualine.nvim",
	enabled = true,
	event = "VeryLazy",
	opts = function()
		local colors = {
			red = "#ca1243",
			grey = "#a0a1a7",
			black = "#383a42",
			white = "#f3f3f3",
			light_green = "#83a598",
			yellow = "#E0AF68",
			orange = "#fe8019",
			green = "#8ec07c",
			shade1 = "#2b2d40",
			shade2 = "#1c1e33",
		}

		local theme = {
			normal = {
				a = { fg = colors.grey, bg = colors.shade2 },
				b = { fg = "#7e7e80", bg = colors.shade2 },
				c = { fg = colors.black, bg = colors.shade2 },
				z = { fg = colors.white, bg = colors.black },
			},
			insert = { a = { fg = colors.grey, bg = "#013f63" } },
			visual = { a = { fg = colors.black, bg = colors.orange } },
			replace = { a = { fg = colors.black, bg = colors.green } },
		}

		local empty = require("lualine.component"):extend()
		function empty:draw(default_highlight)
			self.status = ""
			self.applied_separator = ""
			self:apply_highlights(default_highlight)
			self:apply_section_separators()
			return self.status
		end

		-- Put proper separators and gaps between components in sections
		local function process_sections(sections)
			for name, section in pairs(sections) do
				local left = name:sub(9, 10) < "x"
				for pos = 1, name ~= "lualine_z" and #section or #section - 1 do
					table.insert(section, pos * 2, { empty, color = { fg = colors.white, bg = colors.shade1 } })
				end
				for id, comp in ipairs(section) do
					if type(comp) ~= "table" then
						comp = { comp }
						section[id] = comp
					end
					comp.separator = left and { right = "" } or { left = "" }
				end
			end
			return sections
		end

		local function search_result()
			if vim.v.hlsearch == 0 then
				return ""
			end
			local last_search = vim.fn.getreg("/")
			if not last_search or last_search == "" then
				return ""
			end
			local searchcount = vim.fn.searchcount({ maxcount = 9999 })
			return last_search .. "(" .. searchcount.current .. "/" .. searchcount.total .. ")"
		end

		local function modified()
			if vim.bo.modified then
				return "+"
			elseif vim.bo.modifiable == false or vim.bo.readonly == true then
				return "-"
			end
			return ""
		end

		local scrollbar = {
			function()
				local current_line = vim.fn.line(".")
				local total_lines = vim.fn.line("$")
				local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
				local line_ratio = current_line / total_lines
				local index = math.ceil(line_ratio * #chars)
				return chars[index]
			end,
			padding = { left = 0, right = 0 },
			color = { fg = colors.shade2, bg = colors.bg },
			cond = nil,
		}

		local treesitter = {
			function()
				local b = vim.api.nvim_get_current_buf()
				if next(vim.treesitter.highlighter.active[b]) then
					return ""
				end
				return ""
			end,
			color = { fg = colors.green, bg = colors.shade2 },
			cond = hide_in_width,
		}

		require("lualine").setup({
			options = {
				theme = theme,
				component_separators = "",
				section_separators = { left = "", right = "" },
			},
			sections = process_sections({
				lualine_a = { "mode" },
				lualine_b = {
					"branch",
					"diff",
					{
						"diagnostics",
						source = { "nvim" },
						sections = { "error" },
						diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
					},
					-- {
					-- 	"diagnostics",
					-- 	source = { "nvim" },
					-- 	sections = { "warn" },
					-- 	diagnostics_color = { warn = { bg = colors.orange, fg = colors.white } },
					-- },
					{ "filename", file_status = false, path = 1 },
					-- { modified, color = { bg = colors.red } },
					{
						"%w",
						cond = function()
							return vim.wo.previewwindow
						end,
					},
					{
						"%r",
						cond = function()
							return vim.bo.readonly
						end,
					},
					{
						"%q",
						cond = function()
							return vim.bo.buftype == "quickfix"
						end,
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = { search_result, "filetype" },
				lualine_z = { treesitter, scrollbar },
			}),
			inactive_sections = {
				lualine_c = { "%f %y %m" },
				lualine_x = {},
			},
		})
	end,
}
