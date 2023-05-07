local opts = { noremap = true, silent = true }
local map = vim.api.nvim_set_keymap


-- use jk to exit insert mode
map('i', 'jk', '<ESC>', opts)


-- better up/down
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true })
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true })


-- disable hlsearch
map('n', '<esc>', ":nohlsearch<CR>", {silent = true})


-- delete single character without copying into register
map('n', 'x', '"_x', opts)


-- (;) as (:)
map("n", ";", ":", opts)


-- increment/decrement numbers
map('n', '<leader>+', '<C-a>', { desc = 'Increment number' })
map('n', '<leader>-', '<C-x>', { desc = 'Decrement number' })


-- select all
map('n', '<C-a>', 'gg<S-v>G', opts)


-- Set space as my leader key
map("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- Add undo break-points
map('i', ',', ',<c-g>u', opts)
map('i', '.', '.<c-g>u', opts)
map('i', ';', ';<c-g>u', opts)


-- Better split navigation
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)


-- Resize splits with arrow keys
map("n", "<M-l>", ":vertical resize +1<CR>", opts)
map("n", "<M-h>", ":vertical resize -1<CR>", opts)
map("n", "<M-k>", ":resize +1<CR>", opts)
map("n", "<M-j>", ":resize -1<CR>", opts)


-- Buffer navigation
map("n", "<S-h>", ":BufferLineCyclePrev<CR>", opts)
map("n", "<S-l>", ":BufferLineCycleNext<CR>", opts)
map("n", "[b", ":BufferLineCyclePrev<CR>", opts) map("n", "]b", ":BufferLineCycleNext<CR>", opts)
map("n", "<Tab>", ":BufferLineCycleNext<CR>", opts)
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", opts)

-- Move lines
map("n", "<A-j>", "<cmd>m .+1<cr>==", opts)
map("n", "<A-k>", "<cmd>m .-2<cr>==", opts)
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", opts)
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", opts)
map("v", "<A-j>", ":m '>+1<cr>gv=gv", opts)
map("v", "<A-k>", ":m '<-2<cr>gv=gv", opts)


-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
map("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
map("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })




-- Visual
-- better paste
map('v', 'p', '"_dP', opts)

-- move selected lines
map('v', 'J', ":m '>+1<CR>gv=gv", { desc = 'Move down' })
map('v', 'K', ":m '<-2<CR>gv=gv", { desc = 'Move up' })

-- stay in indent mode
map('v', '<', '<gv', opts)
map('v', '>', '>gv', opts)


-- Lazy keymap
map("n", "<leader>Ll", ":Lazy<CR>", opts)
map("n", "<leader>Lu", ":Lazy update<CR>", opts)
map("n", "<leader>Ls", ":Lazy sync<CR>", opts)
map("n", "<leader>LL", ":Lazy log<CR>", opts)
map("n", "<leader>Lc", ":Lazy clean<CR>", opts)
map("n", "<leader>Lp", ":Lazy profile<CR>", opts)


-- Nvim tree
map("n", "<leader>n", ":NvimTreeToggle<CR>", opts)


-- trouble.nvim keymaps
map("n", "<leader>xx", ":TroubleToggle<CR>", opts)
map("n", "<leader>xw", ":TroubleToggle workspace_diagnostics<CR>", opts)
map("n", "<leader>xd", ":TroubleToggle document_diagnostics<CR>", opts)
map("n", "<leader>xq", ":TroubleToggle quickfix<CR>", opts)
map("n", "<leader>xl", ":TroubleToggle loclist<CR>", opts)
map("n", "<leader>xr", ":TroubleToggle lsp_references<CR>", opts)


-- vim-illuminate
map("n", "<leader>it", ":IlluminateToggle<CR>", opts)
map("n", "<leader>ib", ":IlluminateToggleBuf<CR>", opts)


-- Telescope keybindings
map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
map("n", "<leader>fw", ":Telescope live_grep<CR>", opts)
map("n", "<leader>fB", ":Telescope buffers<CR>", opts)
map("n", "<leader>fh", ":Telescope help_tags<CR>", opts)
map("n", "<leader>fm", ":Telescope man_pages<CR>", opts)
map("n", "<leader>fr", ":Telescope oldfiles<CR>", opts)
map("n", "<leader>fR", ":Telescope registers<CR>", opts)
map("n", "<leader>fk", ":Telescope keymaps<CR>", opts)
map("n", "<leader>fc", ":Telescope commands<CR>", opts)
map("n", "<leader>fb", ":Telescope file_browser<CR>", opts)


-- Telescope undo tree keymap
map("n", "<leader>u", ":Telescope undo<CR>", opts)


-- treesj keymaps
map("n", "<leader>m", ":TSJToggle<CR>", opts)
map("n", "<leader>s", ":TSJSplit<CR>", opts)
map("n", "<leader>j", ":TSJJoin<CR>", opts)


-- Todo comment
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })


-- Rust(cargo.toml) : Update Crates
vim.keymap.set("n", "<leader>rcu", function()
  require("crates").upgrade_all_crates()
end, { desc = "Update All crates"})


-- Rust Debugging
-- Toggle Breakpoint
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle Breakpoint" })
map("n", "<leader>dbs", "<cmd> RustDebuggables <CR>", { desc = "Open Panel" })
map("n", "<leader>dbo", "<cmd> DapStepOver <CR>", { desc = "Dap Step Over" })

-- Debugger Panel
vim.keymap.set("n", "<leader>dbp", function()
  local widgets = require('dap.ui.widgets')
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Open Debugger Panel"})

