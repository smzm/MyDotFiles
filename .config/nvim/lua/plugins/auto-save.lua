return {
	"Pocco81/auto-save.nvim",
	enabled = false,
	config = function()
		require("auto-save").setup({
			-- your config goes here
			-- or just leave it empty :)
			trigger_events = { "TermOpen" },
			execution_message = {
				message = function() -- message to print on save
					return ("AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"))
				end,
				dim = 0.7, -- dim the color of `message`
				cleaning_interval = 1000, -- (milliseconds) automatically clean MsgArea after displaying `message`. See :h MsgArea
			},
		})
	end,
}
