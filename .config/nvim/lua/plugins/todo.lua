return {
  "folke/todo-comments.nvim",
  dependencies = {"nvim-lua/plenary.nvim"},
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
       colors = {
          error = { "DiagnosticError", "ErrorMsg", "#DC2626" },
          warning = { "", "WarningMsg", "#FBBF24" },
          info = { "", "#2563EB" },
          hint = { "", "#10B981" },
          default = { "", "#7C3AED" },
          test = { "", "#FF00FF" }
  },
    }
  end
}

-- TODO :
-- NOTE :
-- FIX :
-- WARNING:
-- PERF:
-- HACK:
-- TEST:
