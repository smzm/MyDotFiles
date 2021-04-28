call plug#begin('~/local/share/nvim/plugged')
	Plug 'voldikss/vim-floaterm'                    " Use terminal as a floating/popup window in neovim.
	Plug 'jiangmiao/auto-pairs'                     " insert or delete brackets in pair
 	Plug 'vim-airline/vim-airline'	 	            " status/tabline for vim
 	Plug 'vim-airline/vim-airline-themes'
  	Plug 'sheerun/vim-polyglot'                     " Better Syntax Support
   	Plug 'ryanoasis/vim-devicons'                   " Cool Icons
   	Plug 'alvan/vim-closetag'                       " Auto close (X)HTML tags
   	Plug 'terryma/vim-multiple-cursors'             " Multiple curosr selections for Vim
   	Plug 'junegunn/goyo.vim'			            " Distraction-free writing in Vim
	Plug 'junegunn/limelight.vim'                   " Hyperfocus-writing in Vim - markdown
   	Plug 'haya14busa/incsearch.vim'                 " Improved incremental searching for Vim 
   	Plug 'haya14busa/incsearch-fuzzy.vim'           " incremantal fuzzy search extension for incsearch.vim
   	Plug 'haya14busa/incsearch-easymotion.vim'      
	Plug 'easymotion/vim-easymotion'
  	Plug 'tpope/vim-repeat'				            " enable repeating supported plugin maps
	Plug 'Yggdroot/indentLine'	            		" A vim plugin to display the indention
	Plug 'tpope/vim-fugitive'                       " Git plugin for vim
	Plug 'wadackel/vim-dogrun'						" dogrun theme
   	Plug 'tpope/vim-commentary'                     " comment and uncomment stuff out
	"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	"Plug 'zchee/deoplete-jedi'
  	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'Shougo/context_filetype.vim'              " Completion from other opened files
	Plug 'machakann/vim-highlightedyank'			" Make the yanked region apparent!
	Plug 'mattn/emmet-vim' 							" emmet for vim
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Show colors
	Plug 'tpope/vim-surround'						" provides mappings to easily delete, change and add such surroundings in pairs
	Plug 'rhysd/clever-f.vim'						" Extended f, F, t and T key mappings for Vim. 
	Plug 'AndrewRadev/tagalong.vim'					" Change an HTML(ish) opening tag and take the closing one along as well
	Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} "live edit html, css, and javascript in vim
	Plug '907th/vim-auto-save' 						" Automatically save changes to disk in Vim
	Plug 'NLKNguyen/papercolor-theme' 
    Plug 'Valloric/MatchTagAlways' " A Vim plugin that always highlights the enclosing html/xml tags
    
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    Plug 'glepnir/lspsaga.nvim'

    Plug 'nvim-lua/completion-nvim'
    Plug 'nvim-lua/lsp-status.nvim'
    Plug 'nvim-lua/diagnostic-nvim'
    
    " Set of preconfigured snippets for different languages. 
   Plug 'rafamadriz/friendly-snippets'
    Plug 'hrsh7th/vim-vsnip'

call plug#end()

"===== LSP Plugin Config 
source ~/.config/nvim/plug-config/lsp-config.vim
luafile ~/.config/nvim/lua/plugins/compe-config.lua
luafile ~/.config/nvim/lua/lsp/python-ls.lua
luafile ~/.config/nvim/lua/lsp/lua-ls.lua
luafile ~/.config/nvim/lua/lsp/html-ls.lua
luafile ~/.config/nvim/lua/lsp/css-ls.lua
luafile ~/.config/nvim/lua/lsp/tsserver-ls.lua
luafile ~/.config/nvim/lua/lsp/vim-ls.lua
luafile ~/.config/nvim/lua/lsp/json-ls.lua
luafile ~/.config/nvim/lua/lsp/emmet-ls.lua



"------------------------- Theme
set background=light

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'color00' : ['#e3e3e3', '232'],
  \         'linenumber_bg' : ['#e3e3e3', '232'],
  \          'allow_bold' : 1,
  \          'allow_italic' : 1,
  \          'color03' : ['#0055ff', '232'],
  \          'color07' : ['#636363', '232'],
  \          'color09' : ['#5b00db', '232'],
  \          'color15' : ['#5b00db', '232'],
  \       }
  \     }
  \   }
  \ }

"------------- Theme ----------
let g:airline_theme = "atomic"
set termguicolors     " enable true colors support


" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

colorscheme PaperColor

"Highlight search color 
" General
hi Error guibg=#bfbfbf
hi Search guibg=#fcba03
hi Normal guibg=#e3e3e3
hi LineNr guifg=#b3b3b3
hi CursorLineNr guifg=#787878
hi CursorLineNr guibg=#e3e3e3
hi CursorLine guibg=#dedede
hi Comment guifg=#a1a1a1
hi Comment gui=italic
hi Function guifg=#e85900 gui=bold
hi Cursor guibg=black 
hi Visual guibg=black 
hi PythonOperator guifg=#1d1485 gui=italic,bold
hi PythonStatement guifg=#023ae0 gui=italic,bold
hi PythonBuiltin guifg=#bd863d
hi Float guifg=#059c43
hi Boolean guifg=#bd863d
hi Conditional guifg=#c15fe1
hi String guifg=#059c43 
hi Repeat guifg=#c15fe1
hi Exception guifg=#c15fe1
hi Constant guifg=#f25d00
hi Number guifg=#059c43
hi Statement guifg=#db2e4e gui=bold
hi Label guifg=#bdbdbd
hi PreProc guifg=#c15fe1
hi ClsasStorage guifg=#9c0091 
hi Structure guifg=#4b00b5
hi Floaterm guifg=#bdbdbd
hi FloatermBorder guifg=#1d1485 guibg=#e3e3e3
hi EasyMotionShade guibg=#e3e3e3
hi EasyMotionTarget guifg=white guibg=#d92b00
hi PMenu guibg=#dedede
hi DiffText guibg=#00660a guifg=black
hi DiffAdd guibg=#34464f
hi DiffDelete guibg=#db2e4e guifg=#000000
hi SpellBad guibg=#ba9e9e
" HTML
hi htmlTagName guifg=#f25d00
hi htmlTag guifg=#1e7570 
hi htmlEndTag guifg=#1e7570
hi htmlArg guifg=#e86500
hi htmlTitle guifg=#e86500 

" CSS 
" Matchup plugin
hi MatchWord guibg=#e3e3e3 guifg=blue gui=underline
hi MatchWordCur guibg=#e3e3e3 guifg=blue gui=underline
hi MatchParen guibg=#e3e3e3 guifg=blue gui=underline
hi MatchParenCur guibg=#e3e3e3 guifg=blue gui=underline

" VIM Tabs
hi TabLineFill guibg=#cfcfcf guifg=white
hi TabLine guibg=#cfcfcf guifg=white
hi TabLineSel guibg=#b3b3b3 guifg=white gui=bold



"---------- Floaterm ----------
nnoremap <A-f> :FloatermNew lf<CR>
nnoremap <A-t> :FloatermNew<CR>
let g:floaterm_keymap_prev   = '<F9>'
let g:floaterm_keymap_next   = '<F10>'
let g:floaterm_keymap_toggle = '<F12>'				" Start with Floaterm and lf command

" run <Floaterm lf> just if ran nvim without any argument
let g:vimArguments = execute("args")
if len(g:vimArguments) == 0
	autocmd VimEnter * FloatermNew lf  
endif

" Binding F5 to save and run python code inside floaterm window
:function RunPython()
	:execute "w"
	:FloatermNew clear && python3 %:p
:endfunction

nnoremap <F5> :call RunPython()<CR>
inoremap <F5> <esc> :call RunPython()<CR>



 " ---------- Vim-:airline ----------
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1
let g:airline_powerline_fonts = 1



" ---------- CloseTag ----------
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'



"---------- Devicon ----------
" loading the plugin
let g:webdevicons_enable = 1

" adding the custom source to unite
 let g:webdevicons_enable_unite = 1

 " adding the column to vimfiler
let g:webdevicons_enable_vimfiler = 1

" ctrlp glyphs
let g:webdevicons_enable_ctrlp = 1

" adding to flagship's statusline
let g:webdevicons_enable_flagship_statusline = 1

" use double-width(1) or single-width(0) glyphs
"  only manipulates padding, has no effect on terminal or set(guifont) font
let g:WebDevIconsUnicodeGlyphDoubleWidth = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '



" ---------- Goyo ----------

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



" ------------- Easymotion --------------
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
nmap <Leader>w <Plug>(easymotion-overwin-w)

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



"------------------ indentLine ------------------------
let g:indentLine_color_gui = '#282828'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']





"----------------------- Bujo --------------------------
let g:bujo#window_width = 40


"-------  fuzzy-search with EasyMotion+incsearch -------
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


"---------------------- Commentary ---------------------
" map ctrl + / to comment and uncomment with commantary
map <C-_> gc


"----------------------- Semshi -------------------------
hi semshiSelected guifg=#8ff500 guibg=#262b2e gui=bold
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#808080
hi semshiImported        ctermfg=214 guifg=#e37900 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#e34c00
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#db0071
hi semshiBuiltin         ctermfg=207 guifg=#0088e3
hi semshiAttribute       ctermfg=49  guifg=#00b58e
hi semshiSelf            ctermfg=249 guifg=#fc0384
hi semshiUnresolved      ctermfg=226 guifg=#f5005e cterm=underline gui=underline

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>


"----------------------  Deoplete ----------------------

"" Use deoplete.
"let g:deoplete#enable_at_startup = 1
"call deoplete#custom#option({
"\   'ignore_case': v:true,
"\   'smart_case': v:true,
"\})
"" complete with words from any opened file
"let g:context_filetype#same_filetypes = {}
"let g:context_filetype#same_filetypes._ = '_'

"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
"inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"set splitbelow

"" maximum candidate window length
"call deoplete#custom#source('_', 'max_menu_width', 80)


"--------------------- vim-hexokinase ----------------------
let g:Hexokinase_highlighters = ['backgroundfull']
"let g:Hexokinase_highlighters = ['foregroundfull']

"-------------------------- Emmet --------------------------
" Redefine trigger key : remap the default <C-Y> leader
let g:user_emmet_leader_key=','  " >>> (,) still needs to be entered

"Enable just for html/css
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall

"------------------------------- vim-auto-save ------------------------------------
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_events = ["InsertLeave", "TextChanged"]


" -------------------------------------- LSP ---------------------------------------



"----------------------------- LSP SAGA
" lsp provider to find the cursor word definition and reference
nnoremap <silent> gh <cmd>lua require'lspsaga.provider'.lsp_finder()<CR>
"  or use command LspSagaFinder
nnoremap <silent> gh :Lspsaga lsp_finder<CR>

"-- code action
nnoremap <silent><leader>ca <cmd>lua require('lspsaga.codeaction').code_action()<CR>
vnoremap <silent><leader>ca :<C-U>lua require('lspsaga.codeaction').range_code_action()<CR>
"-- or use command
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>


"-- show hover doc
nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
"-- or use command
nnoremap <silent>K :Lspsaga hover_doc<CR>

"-- scroll down hover doc or scroll in definition preview
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
"-- scroll up hover doc
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

"-- show signature help
nnoremap <silent> gs <cmd>lua require('lspsaga.signaturehelp').signature_help()<CR>
"-- or command
nnoremap <silent> gs :Lspsaga signature_help<CR>

"-- rename
nnoremap <silent>gr <cmd>lua require('lspsaga.rename').rename()<CR>
"-- or command
nnoremap <silent>gr :Lspsaga rename<CR>
"-- close rename win use <C-c> in insert mode or `q` in noremal mode or `:q`

"-- preview definition
nnoremap <silent> gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
"-- or use command
nnoremap <silent> gd :Lspsaga preview_definition<CR>

