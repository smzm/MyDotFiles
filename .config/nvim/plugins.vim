call plug#begin('~/local/share/nvim/plugged')
    " Theme
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'rose-pine/neovim'

    " Utility
    Plug 'voldikss/vim-floaterm'                    " Use terminal as a floating/popup window in neovim.
	Plug 'jiangmiao/auto-pairs'                     " insert or delete brackets in pair
   	Plug 'alvan/vim-closetag'                       " Auto close (X)HTML tags
  	Plug 'tpope/vim-repeat'				            " enable repeating supported plugin maps
    Plug 't9md/vim-textmanip'                       " Move selected lines or block area to specified direction
   	Plug 'tpope/vim-commentary'                     " comment and uncomment stuff out
   	Plug 'junegunn/goyo.vim'			            " Distraction-free writing in Vim
	Plug 'tpope/vim-surround'						" provides mappings to easily delete, change and add such surroundings in pairs
	Plug 'rhysd/clever-f.vim'						" Extended f, F, t and T key mappings for Vim. 
	Plug '907th/vim-auto-save' 						" Automatically save changes to disk in Vim
    Plug 'tpope/vim-abolish'                        " easily search for, substitute, and abbreviate multiple variants of a word
    Plug 'haya14busa/incsearch.vim'                 " Improved incremental searching for Vim 
   	Plug 'haya14busa/incsearch-fuzzy.vim'           " incremantal fuzzy search extension for incsearch.vim
   	Plug 'haya14busa/incsearch-easymotion.vim'      
	Plug 'easymotion/vim-easymotion'
  
    " HTML and CSS
	Plug 'mattn/emmet-vim' 							" emmet for vim
	Plug 'AndrewRadev/tagalong.vim'					" Change an HTML(ish) opening tag and take the closing one along as well
	Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} "live edit html, css, and javascript in vim
    Plug 'Valloric/MatchTagAlways'                  " A Vim plugin that always highlights the enclosing html/xml tags
    
    " Git and Github
    Plug 'github/copilot.vim'                       " Neovim plugin for GitHub Copilot

    " UI
	Plug 'Yggdroot/indentLine'	            		" A vim plugin to display the indention
	Plug 'machakann/vim-highlightedyank'			" Make the yanked region apparent!
    Plug 'kyazdani42/nvim-web-devicons'             " lua `fork` of vim-web-devicons for neovim
    Plug 'hoob3rt/lualine.nvim'                     " A blazing fast and easy to configure neovim statusline written in pure lua.
    Plug 'akinsho/bufferline.nvim'                  " A statusline plugin for neovim  
    Plug 'kyazdani42/nvim-tree.lua'                 " A tree plugin for neovim
    Plug 'mvllow/modes.nvim'                        " Line Decoration 

    " Language Pack
    Plug 'sheerun/vim-polyglot'                     " A collection of language packs for Vim
    Plug 'neovim/nvim-lspconfig'                    " Quickstart configurations for the Nvim LSP client
	Plug 'onsails/lspkind-nvim'                     " vscode-like pictograms for neovim lsp completion items
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'nvim-lua/diagnostic-nvim'
   
    " Auto Completion
    Plug 'hrsh7th/cmp-nvim-lsp'                     " LSP completion plugin for neovim
    Plug 'hrsh7th/cmp-buffer'                       " Buffer completion
    Plug 'hrsh7th/cmp-path'                         " Path completion
    Plug 'hrsh7th/cmp-cmdline'                      " Command line completion
    Plug 'hrsh7th/nvim-cmp'                         " Nvim completion
    Plug 'Shougo/context_filetype.vim'              " Completion from other opened files
    Plug 'hrsh7th/cmp-calc'                         " Math Calculation completion
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'      " Signature help completion
    Plug 'hrsh7th/cmp-copilot'
    Plug 'hrsh7th/cmp-emoji'
    Plug 'kdheepak/cmp-latex-symbols'

    " Syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Nvim Treesitter configurations and abstraction layer
    Plug 'JuliaEditorSupport/julia-vim'


    " Snippets
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'

    Plug 'MunifTanjim/nui.nvim'



call plug#end()




" |||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Theme
"" Example config in VimScript
"let g:tokyonight_style = "night"
"let g:tokyonight_italic_functions = 1
"let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]

"" Change the "hint" color to the "orange" color, and make the "error" color bright red
"let g:tokyonight_colors = {
"  \ 'hint': 'orange',
"  \ 'error': '#ff0000'
"\ }

"" Load the colorscheme
"colorscheme tokyonight

" cmp Auto Completion highlights
" gray
highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080

" blue
highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6
highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6

" light blue
highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE

" pink
highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0

" front
highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4


" Github Copilot highlight
" highlight CopilotSuggestion guifg=#38384a guibg=#1a1b26     " For tokynight
highlight CopilotSuggestion guifg=#4d4d62 guibg=#2a283e       " For rose-pine-moon


" Cursor Line highlight
highlight CursorLine guibg=#1a1b26

" Nvim Tree highlight
highlight NvimTreeCursorLine guibg=#2c2936 gui=NONE

" |||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Plugins Configurations
" ***************************  Floaterm *************************** 
let g:floaterm_title='Terminal($1|$2)'
let g:floaterm_wintype='float'
let g:floaterm_width=0.5
let g:floaterm_height=1.0
let g:floaterm_position='topright'

nnoremap <A-f> :FloatermNew --position=center lf <CR>
nnoremap <A-t> :FloatermNew<CR>
let g:floaterm_keymap_prev   = '<F9>'
let g:floaterm_keymap_next   = '<F10>'
let g:floaterm_keymap_toggle = '<F12>'				" Start with Floaterm and lf command


" Binding F5 to save and run python code inside floaterm window
:function RunPython()
	:execute "w"
	:FloatermNew clear && python3 %:p
:endfunction

nnoremap <F5> :call RunPython()<CR>
inoremap <F5> <esc> :call RunPython()<CR>



" *************************** auto-pair *************************** 
" Jump outside '"({
if !exists('g:AutoPairsShortcutJump')
  let g:AutoPairsShortcutJump = ',,'
endif


" *************************** vim-textmanip *************************** 
xmap <S-Down> <Plug>(textmanip-move-down)
xmap <S-UP> <Plug>(textmanip-move-up)
xmap <S-LEFT> <Plug>(textmanip-move-left)
xmap <S-RIGHT> <Plug>(textmanip-move-right)

" toggle insert/replace with <F10>
nmap <F3> <Plug>(textmanip-toggle-mode)
xmap <F3> <Plug>(textmanip-toggle-mode)


" *************************** Commentary *************************** 
" map ctrl + / to comment and uncomment with commantary
map <C-_> gc



" *************************** Goyo *************************** 
function! s:goyo_enter()
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

"	if executable('tmux') && strlen($TMUX)
"		silent !tmux set status off
"		silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
"	endif
    set noshowmode
    set noshowcmd
    set scrolloff=999
    "Limelight
     " ...
endfunction

function! s:goyo_leave()
	  " Quit Vim if this is the only remaining buffer
	  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
	       if b:quitting_bang
	         qa!
	       else
	         qa
	       endif
	  endif
"	  if executable('tmux') && strlen($TMUX)
"		  silent !tmux set status on
"	          silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
"	  endif
	  set showmode
	  set showcmd
	  set scrolloff=5
	  "Limelight!
	  " ... 
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
"nnoremap <F6> :Goyo <CR>



" *************************** vim-auto-save *************************** 
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_events = ["InsertLeave", "TextChanged"]



" *************************** Easymotion *************************** 
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
map <Leader>w <Plug>(easymotion-overwin-w)

" Search with / using easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Require tpope/vim-repeat to enable dot repeat support
" Jump to anywhere with only `s{char}{target}`
" `s<CR>` repeat last find motion.
nmap s <Plug>(easymotion-s)
" Bidirectional & within line 't' motion
omap t <Plug>(easymotion-bd-tl)
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
"  " type `l` and match `l`&`L`
let g:EasyMotion_smartcase = 1
" Smartsign (type `3` and match `3`&`#`)
let g:EasyMotion_use_smartsign_us = 1

"-------  fuzzy-search with EasyMotion+incsearch 
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
    \   'converters': [incsearch#config#fuzzyword#converter()],
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {"\<CR>": '<Over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())


" *************************** abolish *************************** 
" change all variants of highlighted text with ctr+r
vnoremap <C-r> "hy:%Subvert/<C-r>h//gc<left><left><left>



" *************************** Emmet *************************** 
" Redefine trigger key : remap the default <C-Y> leader
let g:user_emmet_leader_key='.'  " >>> (,) still needs to be entered

"Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall



" *************************** indentLine *************************** 
let g:indentLine_color_gui = '#2d3541'
let g:indentLine_char_list = ['.']



" *************************** vim-hexokinase *************************** 
" let g:Hexokinase_highlighters = ['backgroundfull']
" let g:Hexokinase_highlighters = ['foregroundfull']



" *************************** Polyglot *************************** 
let g:python_highlight_space_errors = 0



" |||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Lua Plugins Configurations
lua << EOF
-- *************************** LSP Config

-- sudo npm i -g pyright
-- sudo npm i -g @tailwindcss/language-server
-- sudo npm i -g vim-language-server
-- sudo npm i -g vscode-langservers-extracted
-- sudo npm i -g typescript typescript-language-server
-- sudo npm i -g awk-language-server
-- sudo npm i -g dockerfile-language-server-nodejs
-- sudo npm i -g emmet-ls
-- sudo npm i -g spectral-language-server  (yaml/json)

local nvim_lsp = require "lspconfig"


require'lspconfig'.pyright.setup{
   settings = {
      pyright = {
        on_attach = on_attach,
        capabilities = capabilities,
        typeCheckingMode = 'off'
      },
    },
}
require'lspconfig'.vimls.setup {}
require'lspconfig'.jsonls.setup {}
require'lspconfig'.html.setup {}
require'lspconfig'.cssls.setup{}
require'lspconfig'.tailwindcss.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.bashls.setup{}
require'lspconfig'.awk_ls.setup{}
require'lspconfig'.dockerls.setup{}
require'lspconfig'.emmet_ls.setup{}
require'lspconfig'.spectral.setup{}

 
-- function to attach completion when setting up lsp
local on_attach = function(client, bufnr)
    lsp_status.register_progress()
    lsp_status.config(
        {
            status_symbol = "LSP ",
            indicator_errors = "E",
            indicator_warnings = "W",
            indicator_info = "I",
            indicator_hint = "H",
            indicator_ok = "ok"
        }
    )
 
    require "completion".on_attach(client)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local opts = {noremap = true, silent = true}
    buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)

    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    elseif client.resolved_capabilities.document_range_formatting then
        buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
    end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
            autocmd! * <buffer>
            " autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
            autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            " autocmd CursorHold *.* :lua vim.lsp.diagnostic.show_line_diagnostics()
            autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 300)
           augroup END
        ]],
            false
        )
    else
        vim.api.nvim_exec([[
            autocmd!
            autocmd BufWritePre * Neoformat
            augroup END
        ]], false)
    end
end



vim.diagnostic.config({
  virtual_text = false,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
}) 

-- Highlight line number instead of having icons in sign column
vim.cmd [[
  highlight DiagnosticLineNrError guibg=# guifg=#8a0000 gui=bold
  highlight DiagnosticLineNrWarn guibg=# guifg=#FFA500 gui=bold
  highlight DiagnosticLineNrInfo guibg=# guifg=#00FFFF gui=bold
  highlight DiagnosticLineNrHint guibg=# guifg=#8a6c00 gui=bold

  sign define DiagnosticSignError text= texthl=DiagnosticSignError linehl= numhl=DiagnosticLineNrError
  sign define DiagnosticSignWarn text= texthl=DiagnosticSignWarn linehl= numhl=DiagnosticLineNrWarn
  sign define DiagnosticSignInfo text= texthl=DiagnosticSignInfo linehl= numhl=DiagnosticLineNrInfo
  sign define DiagnosticSignHint text= texthl=DiagnosticSignHint linehl= numhl=DiagnosticLineNrHint
]]

-- Show line diagnostics automatically in hover window
-- You will likely want to reduce updatetime which affects CursorHold
-- note: this setting is global and should be set only once
vim.o.updatetime = 250
-- For diagnostics for specific cursor positio
vim.cmd [[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]





-- *************************** LSP Cmp
 -- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
      ['<C-PageUp>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-PageDown>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      -- Accept currently selected item. If none selected, `select` first item.
      -- Set `select` to `false` to only confirm explicitly selected items.
      ['<CR>'] = cmp.mapping.confirm({ select = false }),
      ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
      ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'path' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'calc' },
      { name = 'cmdline' },
      { name = 'emoji' },
      { name = 'latex_symbols' },
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())



local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = ""
}
local cmp = require('cmp')
cmp.setup {
  formatting = {
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        luasnip = "[LuaSnip]",
        nvim_lua = "[Lua]",
        latex_symbols = "[LaTeX]",
      })[entry.source.name]
      return vim_item
    end
  },
}




-- *************************** Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "fish",
    "php",
    "json",
    "yaml",
    "swift",
    "html",
    "scss",
    "python",
    "lua"
  },
   incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()





-- *************************** Lualine
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require 'lualine'

-- Color table for highlights
local colors = {
  bg = '#1b1724',
  fg = '#414452',
  yellow = '#ECBE7B',
  cyan = '#008080',
  darkblue = '#081633',
  green = '#89b0bb',
  orange = '#FF8800',
  violet = '#a9a1e1',
  magenta = '#c678dd',
  blue = '#51afef',
  red = '#ec5f67'
}

local conditions = {
  buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
  hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
  check_git_workspace = function()
    local filepath = vim.fn.expand('%:p:h')
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end
}

-- Config
local config = {
  options = {
    -- Disable sections and component separators
    component_separators = "",
    section_separators = "",
    theme = {
      -- We are going to use lualine_c an lualine_x as left and
      -- right section. Both are highlighted by c theme .  So we
      -- are just setting default looks o statusline
      normal = {c = {fg = colors.fg, bg = colors.bg}},
      inactive = {c = {fg = colors.fg, bg = colors.bg}}
    }
  },
  sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_b = {},
    lualine_y = {},
    lualine_z = {},
    -- These will be filled later
    lualine_c = {},
    lualine_x = {}
  },
  inactive_sections = {
    -- these are to remove the defaults
    lualine_a = {},
    lualine_v = {},
    lualine_y = {},
    lualine_z = {},
    lualine_c = {},
    lualine_x = {}
  }
}

-- Inserts a component in lualine_c at left section
local function ins_left(component)
  table.insert(config.sections.lualine_c, component)
end

-- Inserts a component in lualine_x ot right section
local function ins_right(component)
  table.insert(config.sections.lualine_x, component)
end

ins_left {
  function() return '▊' end,
  color = {fg = colors.blue}, -- Sets highlighting of component
  left_padding = 0 -- We don't need space before this
}

ins_left {
  -- mode component
  function()
    -- auto change color according to neovims mode
    local mode_color = {
      n = colors.red,
      i = colors.green,
      v = colors.blue,
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
      ic = colors.yellow,
      R = colors.violet,
      Rv = colors.violet,
      cv = colors.red,
      ce = colors.red,
      r = colors.cyan,
      rm = colors.cyan,
      ['r?'] = colors.cyan,
      ['!'] = colors.red,
      t = colors.red
    }
    vim.api.nvim_command(
        'hi! LualineMode guifg=' .. mode_color[vim.fn.mode()] .. " guibg=" ..
            colors.bg)
    return ''
  end,
  color = "LualineMode",
  left_padding = 0
}

ins_left {
  -- filesize component
  function()
    local function format_file_size(file)
      local size = vim.fn.getfsize(file)
      if size <= 0 then return '' end
      local sufixes = {'b', 'k', 'm', 'g'}
      local i = 1
      while size > 1024 do
        size = size / 1024
        i = i + 1
      end
      return string.format('%.1f%s', size, sufixes[i])
    end
    local file = vim.fn.expand('%:p')
    if string.len(file) == 0 then return '' end
    return format_file_size(file)
  end,
  condition = conditions.buffer_not_empty
}

ins_left {
  'filename',
  condition = conditions.buffer_not_empty,
  color = {fg = "#608f91", gui = 'bold'}
}

ins_left {'location'}

ins_left {'progress', color = {fg = colors.fg, gui = 'bold'}}

ins_left {
  'diagnostics',
  sources = {'nvim_diagnostic'},
  symbols = {error = ' ', warn = ' ', info = ' '},
  color_error = colors.red,
  color_warn = colors.yellow,
  color_info = colors.cyan
}

-- Insert mid section. You can make any number of sections in neovim :)
-- for lualine it's any number greater then 2
ins_left {function() return '%=' end}

ins_left {
  -- Lsp server name .
  function()
    local msg = 'No Active Lsp'
    local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then return msg end
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        return client.name
      end
    end
    return msg
  end,
  icon = ' LSP:',
  color = {fg = '#8677b5', gui = 'bold'}
}

-- Add components to right sections
ins_right {
  'o:encoding', -- option component same as &encoding in viml
  upper = true, -- I'm not sure why it's upper case either ;)
  condition = conditions.hide_in_width,
  color = {fg = colors.green, gui = 'bold'}
}

ins_right {
  'fileformat',
  upper = true,
  icons_enabled = false, -- I think icons are cool but Eviline doesn't have them. sigh
  color = {fg = colors.green, gui = 'bold'}
}

ins_right {
  'branch',
  icon = '',
  condition = conditions.check_git_workspace,
  color = {fg = colors.violet, gui = 'bold'}
}

ins_right {
  'diff',
  -- Is it me or the symbol for modified us really weird
  symbols = {added = ' ', modified = '柳 ', removed = ' '},
  color_added = colors.green,
  color_modified = colors.orange,
  color_removed = colors.red,
  condition = conditions.hide_in_width
}

ins_right {
  function() return '▊' end,
  color = {fg = colors.blue},
  right_padding = 0
}

-- Now don't forget to initialize lualine
lualine.setup(config)




-- *************************** Bufferline
require('bufferline').setup {
  options = {
    offsets = {
      { filetype = "NvimTree",
        text = "File Explorer",
        highlight = "Directory",
        text_align = "left"  
      }
    }
  }
}
-- Buffer pick functionality
vim.cmd'nnoremap <silent>gb :BufferLinePick<CR>'
vim.cmd'nnoremap <silent><C-Right> :BufferLineCycleNext<CR>'
vim.cmd'nnoremap <silent><C-Left> :BufferLineCyclePrev<CR>'


-- *************************** NvimTree
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash = {
    cmd = "trash",
    require_confirm = true
  }
}

-- <C-]> will cd in the directory under the cursor
-- <C-v> will open the file in a vertical split
-- <Tab> will open the file as a preview (keeps the cursor in the tree)
vim.cmd'nnoremap <C-n> :NvimTreeToggle<CR>'
vim.cmd'nnoremap <C-m> :NvimTreeFocus<CR>'
vim.cmd[[
let g:nvim_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★",
    \   'deleted': "",
    \   'ignored': "◌"
    \   },
    \ 'folder': {
    \   'arrow_open': "",
    \   'arrow_closed': "",
    \   'default': "",
    \   'open': "",
    \   'empty': "",
    \   'empty_open': "",
    \   'symlink': "",
    \   'symlink_open': "",
    \   }
    \ }
]]


-- ************************************************ Lua Theme : rose-pine
--vim.o.background = 'light'

require('rose-pine').setup({
	---@usage 'main'|'moon'
	dark_variant = 'main',
	bold_vert_split = false,
	dim_nc_background = false,
	disable_background = false,
	disable_float_background = false,
	disable_italics = true,
	---@usage string hex value or named color from rosepinetheme.com/palette
	groups = {
		background = 'base',
		panel = 'surface',
		border = 'highlight_med',
		comment = 'muted',
		link = 'iris',
		punctuation = 'subtle',

		error = 'love',
		hint = 'iris',
		info = 'foam',
		warn = 'gold',

		headings = {
			h1 = 'iris',
			h2 = 'foam',
			h3 = 'rose',
			h4 = 'gold',
			h5 = 'pine',
			h6 = 'foam',
		}
		-- or set all headings at once
		-- headings = 'subtle'
	},
	-- Change specific vim highlight groups
	highlight_groups = {
		ColorColumn = { bg = 'rose' }
	}
})

-- set colorscheme after options
vim.cmd('colorscheme rose-pine')


-- *************************** mode
require('modes').setup({
  colors = {
    copy = "#f5c359",
    delete = "#c75c6a",
    insert = "#78ccc5",
    visual = "#9745be",
  },

  -- Cursorline highlight opacity
  line_opacity = 0.1,

  -- Highlight cursor
  set_cursor = true,

  -- Highlight in active window only
  focus_only = false
})
EOF

