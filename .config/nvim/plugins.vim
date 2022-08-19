call plug#begin('~/local/share/nvim/plugged')
    " Theme
	Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
    Plug 'kaicataldo/material.vim', { 'branch': 'main' }


    " Utility
    Plug 'voldikss/vim-floaterm'                    " Use terminal as a floating/popup window in neovim.
    Plug 'windwp/nvim-autopairs'
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
    Plug 'smzm/hydrovim' | Plug 'MunifTanjim/nui.nvim'
    
    " HTML and CSS
	Plug 'mattn/emmet-vim' 							" emmet for vim
	Plug 'AndrewRadev/tagalong.vim'					" Change an HTML(ish) opening tag and take the closing one along as well
	Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} "live edit html, css, and javascript in vim
    Plug 'Valloric/MatchTagAlways'                  " A Vim plugin that always highlights the enclosing html/xml tags
    
    " Git and Github
    Plug 'github/copilot.vim'                       " Neovim plugin for GitHub Copilot

    " UI
	Plug 'machakann/vim-highlightedyank'			" Make the yanked region apparent!
    Plug 'kyazdani42/nvim-web-devicons'             " lua `fork` of vim-web-devicons for neovim
    Plug 'hoob3rt/lualine.nvim'                     " A blazing fast and easy to configure neovim statusline written in pure lua.
    Plug 'akinsho/bufferline.nvim'                  " A statusline plugin for neovim  
    Plug 'kyazdani42/nvim-tree.lua'                 " A tree plugin for neovim
    Plug 'mvllow/modes.nvim'                        " Line Decoration 
    Plug 'stevearc/aerial.nvim'
    Plug 'wfxr/minimap.vim'
    Plug 'p00f/nvim-ts-rainbow'
    Plug 'lukas-reineke/indent-blankline.nvim'


    " Language Pack
    Plug 'sheerun/vim-polyglot'                     " A collection of language packs for Vim
    Plug 'neovim/nvim-lspconfig'                    " Quickstart configurations for the Nvim LSP client
    Plug 'williamboman/mason.nvim'                  " Portable package manager for Neovim that runs everywhere Neovim runs. Easily install and manage LSP servers, DAP servers, linters, and formatters.
    Plug 'williamboman/mason-lspconfig.nvim'

    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'nvim-lua/diagnostic-nvim'
    Plug 'sbdchd/neoformat'                         " A vim plugin to format code using Neoformat
   
    " Auto Completion
    Plug 'hrsh7th/nvim-cmp'                         " Nvim completion
    Plug 'hrsh7th/cmp-nvim-lsp'                     " LSP completion plugin for neovim
    Plug 'hrsh7th/cmp-buffer'                       " Buffer completion
    Plug 'hrsh7th/cmp-path'                         " Path completion
    Plug 'hrsh7th/cmp-cmdline'                      " Command line completion
    Plug 'Shougo/context_filetype.vim'              " Completion from other opened files
    Plug 'hrsh7th/cmp-calc'                         " Math Calculation completion
    Plug 'hrsh7th/cmp-nvim-lsp-signature-help'      " Signature help completion
    Plug 'hrsh7th/cmp-copilot'
    Plug 'hrsh7th/cmp-emoji'
    Plug 'hrsh7th/cmp-nvim-lua'
    Plug 'kdheepak/cmp-latex-symbols'
    Plug 'ray-x/cmp-treesitter'
    Plug 'saadparwaiz1/cmp_luasnip'


    " Syntax highlighting
    Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' } " Nvim Treesitter configurations and abstraction layer
    Plug 'nvim-treesitter/nvim-treesitter-context'
    Plug 'nvim-treesitter/nvim-tree-docs'
    Plug 'nvim-treesitter/completion-treesitter'
    Plug 'JuliaEditorSupport/julia-vim'
    Plug 'RRethy/nvim-treesitter-textsubjects'


    " Snippets
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'L3MON4D3/LuaSnip'
    Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()




" |||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Theme
" TOKYONIGHT
"" Example config in VimScript
let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = [ "qf", "vista_kind", "terminal", "packer" ]
"" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }
"" Load the colorscheme
colorscheme tokyonight


" Github Copilot highlight
highlight CopilotSuggestion guifg=#38384a guibg=#1a1b26     " For tokynight


" Cursor Line highlight
highlight CursorLine guibg=#11121a

" Nvim Tree highlight
highlight NvimTreeCursorLine guibg=#2c2936 gui=NONE

" Treesitter
hi TSVariable guifg=#8e91bd
hi TreesitterContext guibg=#12131c
hi rainbowcol1 guifg=#cc7c27 gui=bold
hi rainbowcol2 guifg=#8e349e gui=bold
hi rainbowcol3 guifg=#1576d1


" Search
hi Search guibg=#8bbd04 guifg=#002911


" |||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Plugins Configurations
" ***************************  Floaterm *************************** 
let g:floaterm_title='Terminal($1|$2)'
let g:floaterm_wintype='float'
let g:floaterm_width=0.5
let g:floaterm_height=1.0
let g:floaterm_position='topright'
highlight link Floaterm Pmenu
highlight link FloatermBorder HopNextKey1
" guibg=#05060a guifg=orange

nnoremap <A-f> :FloatermNew --position=center lf <CR>
nnoremap <A-t> :FloatermNew<CR>
let g:floaterm_keymap_prev   = '<F9>'
let g:floaterm_keymap_next   = '<F10>'
let g:floaterm_keymap_toggle = '<F12>'				" Start with Floaterm and lf command


"Binding F5 to save and run python code inside floatermncmd t window
:function RunPython()
	:execute "w"

	" :FloatermNew clear && python3 %:p
      :FloatermNew --width=0.5 --name=repl --position=right --wintype=float ipython --no-autoindent
:endfunction

" xnoremap <F5> :'<,'> FloatermNew FloatermSend <CR>
     
xnoremap <F5> :FloatermNew --width=0.5 --name=repl --position=right --wintype=float ipython --no-autoindent <CR>
nnoremap <F5> :call RunPython()<CR>
inoremap <F5> <esc> :call RunPython()<CR>



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
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

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



" *************************** vim-hexokinase *************************** 
" let g:Hexokinase_highlighters = ['backgroundfull']
" let g:Hexokinase_highlighters = ['foregroundfull']



" *************************** Polyglot *************************** 
let g:python_highlight_space_errors = 0


" ************************* Neoformat *************************** 
" Configure enabled formatters.
"let g:neoformat_enabled_python = ['autopep8']

" " run a formatter on save
"augroup fmt
"  autocmd!
"  autocmd BufWritePre * undojoin | Neoformat
"augroup END


" *************************** minimap *************************** 
let g:minimap_width = 4
let g:minimap_auto_start = 1
let g:minimap_auto_start_win_enter = 1
let g:minimap_enable_highlight_colorgroup = 1
let g:minimap_highlight_range = 0
let g:minimap_cursor_color = 'Tag'
let g:minimap_range_color = "Tag"
let g:minimap_base_highlight = 'LineNR'
let g:minimap_git_colors = 1

:highlight minimapCDA guifg=#184e25 guibg=#1a1b26
:highlight minimapCDAA guifg=#26ad46 guibg=#1a1b26
let g:minimap_diffadd_color="minimapCDA"
let g:minimap_cursor_diffadd_color= 'minimapCDAA'
let g:minimap_range_diffadd_color = 'minimapCDAA'


:highlight minimapCDR guifg=#75212f guibg=#1a1b26
:highlight minimapCDRR guifg=#c93851 guibg=#1a1b26
let g:minimap_diffremove_color="minimapCDR"
let g:minimap_cursor_diffremove_color= 'minimapCDRR'
let g:minimap_range_diffremove_color = 'minimapCDRR'

:highlight minimapCDC guifg=#754b21 guibg=#1a1b26
:highlight minimapCDCC guifg=#d17d2a guibg=#1a1b26
let g:minimap_diff_color="minimapCDC"
let g:minimap_cursor_diff_color =  'minimapCDCC'
let g:minimap_range_diff_color = 'minimapCDCC'

function! FloatWindowMinimapHack() abort
  if winnr() == bufwinnr('-MINIMAP-')
      exe "wincmd w"
  endif
endfunction

autocmd WinEnter * call FloatWindowMinimapHack()



" |||||||||||||||||||||||||||||||||||||||||||||||||||||||||| Lua Plugins Configurations
lua << EOF
-- *************************** LSP Config : Servers

require("mason").setup({
 ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    },
})
local servers = { "pyright", "tsserver", "awk_ls", "bashls" , "cssmodules_ls", "dockerls", "html", "emmet_ls", "jsonls", "sumneko_lua", "marksman", "sqls", "tailwindcss", "vimls", "yamlls"}
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true
})

-- Add additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
local lspconfig = require('lspconfig')


-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities
  }
end

-- ==================== LSP Config : Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end
-- python specific costumizations
local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
   on_attach = on_attach,
   typeCheckingMode = 'off',
   flags = lsp_flags,
}


-- ====================== LSP : Diagnostic UI
vim.diagnostic.config({
  virtual_text = false,
  signs = false,
  underline = false,
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
-- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})]]


-- ====================== Go-to definition in a split window
local function goto_definition(split_cmd)
  local util = vim.lsp.util
  local log = require("vim.lsp.log")
  local api = vim.api

  -- note, this handler style is for neovim 0.5.1/0.6, if on 0.5, call with function(_, method, result)
  local handler = function(_, result, ctx)
    if result == nil or vim.tbl_isempty(result) then
      local _ = log.info() and log.info(ctx.method, "No location found")
      return nil
    end

    if split_cmd then
      vim.cmd(split_cmd)
    end

    if vim.tbl_islist(result) then
      util.jump_to_location(result[1])

      if #result > 1 then
        util.set_qflist(util.locations_to_items(result))
        api.nvim_command("copen")
        api.nvim_command("wincmd p")
      end
    else
      util.jump_to_location(result)
    end
  end

  return handler
end

vim.lsp.handlers["textDocument/definition"] = goto_definition('split')



-- *************************** LSP Cmp
 -- Set completeopt to have a better completion experience
vim.o.completeopt = 'menu,menuone,noselect'


  -- Setup nvim-cmp.
 local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
       ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), {'i', 'c'}),
       ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), {'i', 'c'}),
       ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), {'i', 'c'}),
       ['<C-e>'] = cmp.mapping({ i = cmp.mapping.close(), c = cmp.mapping.close() }),
       ['<Down>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
       ['<Up>'] = cmp.mapping(cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }), {'i'}),
       ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
   }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      { name = 'path' },
      { name = 'nvim_lsp_signature_help' },
      { name = 'calc' },
      { name = 'cmdline' },
      { name = 'emoji' },
      { name = 'latex_symbols' },
      { name = 'nvim_lua' },
      { name = 'luasnip' },
      { name = 'treesitter' },
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

-- Use buffer source for `/` (if you cnabled `native_menu`, this won't work anymore).
 cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })


  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

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

-- Theme Colors to the cmp Menu
-- gray
vim.cmd[[ highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080 ]]
-- blue
vim.cmd[[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6]]
vim.cmd[[highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6]]
-- light blue
vim.cmd[[highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE]]
vim.cmd[[highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE]]
vim.cmd[[highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE]]
-- pink
vim.cmd[[highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0]]
vim.cmd[[highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0]]
-- front
vim.cmd[[highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]]
vim.cmd[[highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4]]
vim.cmd[[highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4]]





-- *************************** Treesitter
require'nvim-treesitter.configs'.setup {
  highlight = {
   },
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
  tree_docs={enable=true},
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
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
    "python",
    "scss",
    "lua"
  },
 textsubjects = {
        enable = true,
        prev_selection = ',', -- (Optional) keymap to select the previous selection
        keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
        },
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

-- ======Treesitter-context
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
    exact_patterns = {
        -- Example for a specific filetype with Lua patterns
        -- Treat patterns.rust as a Lua pattern (i.e "^impl_item$" will
        -- exactly match "impl_item" only)
        -- rust = true,
    },

    -- [!] The options below are exposed but shouldn't require your attention,
    --     you can safely ignore them.

    zindex = 20, -- The Z-index of the context window
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    separator = nil, -- Separator between context and content. Should be a single character string, like '-'.
}


-- ================= aerial.nvim
require('aerial').setup({
  on_attach = function(bufnr)
    -- Toggle the aerial window with <leader>a
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>a', '<cmd>AerialToggle!<CR>', {})
    -- Jump forwards/backwards with '{' and '}'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '{', '<cmd>AerialPrev<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '}', '<cmd>AerialNext<CR>', {})
    -- Jump up the tree with '[[' or ']]'
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '[[', '<cmd>AerialPrevUp<CR>', {})
    vim.api.nvim_buf_set_keymap(bufnr, 'n', ']]', '<cmd>AerialNextUp<CR>', {})
  end
})

-- *************************** Lualine
-- Eviline config for lualine
-- Author: shadmansaleh
-- Credit: glepnir
local lualine = require 'lualine'

-- Color table for highlights
local colors = {
  bg = '#0d0e1a',
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
      [''] = colors.blue,
      V = colors.blue,
      c = colors.magenta,
      no = colors.red,
      s = colors.orange,
      S = colors.orange,
      [''] = colors.orange,
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

-- ins_left {
--   'diagnostics',
--   sources = {'nvim_lsp'},
--   symbols = {error = ' ', warn = ' ', info = ' '},
--   color_error = colors.red,
--   color_warn = colors.yellow,
--   color_info = colors.cyan
-- }

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

-- *************************** indent-blankline (UI)
vim.opt.termguicolors = true
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#252637 gui=nocombine]]

require("indent_blankline").setup {
    -- for example, context is off by default, use this to turn it on
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
    char_highlight_list = {
        "IndentBlanklineIndent1",
    },
    space_char_highlight_list = {
       "IndentBlanklineIndent1",
    },
}

-- *************************** windwp-nvim-autopairs
require('nvim-autopairs').setup({
  disable_in_macro = true,
  enable_check_bracket_line = true,
  disable_in_visualblock = true,
})

EOF

