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
	Plug 'junegunn/limelight.vim'                   " Hyperfocus-writing in Vim
   	Plug 'haya14busa/incsearch.vim'                 " Improved incremental searching for Vim 
   	Plug 'haya14busa/incsearch-fuzzy.vim'           " incremantal fuzzy search extension for incsearch.vim
   	Plug 'haya14busa/incsearch-easymotion.vim'      
	Plug 'easymotion/vim-easymotion'
  	Plug 'tpope/vim-repeat'				            " enable repeating supported plugin maps
	Plug 'Yggdroot/indentLine'	            		" A vim plugin to display the indention
	Plug 'tpope/vim-fugitive'                       " Git plugin for vim
	Plug 'arcticicestudio/nord-vim'				    " nord theme
	Plug 'wadackel/vim-dogrun'						" dogrun theme
   	Plug 'tpope/vim-commentary'                     " comment and uncomment stuff out
	Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
	Plug 'zchee/deoplete-jedi'
    Plug 'Shougo/context_filetype.vim'              " Completion from other opened files
	Plug 'davidhalter/jedi-vim'						" jump to the definition of class and method to check their implementation
	Plug 'machakann/vim-highlightedyank'			" Make the yanked region apparent!
	Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Show colors
	Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

call plug#end()



"------------- Theme ----------
set termguicolors
colorscheme dogrun
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"colorscheme xcodedarkhc

let g:airline_theme = "hybrid"

"Highlight search color 
hi Search guibg=#c7ac00
hi Normal guibg=#1c2022
hi LineNr guifg=#383838
hi CursorLineNr guifg=#808080
hi CursorLine guibg=#292929
hi Comment guifg=#626262
hi Comment gui=italic
hi Function guifg=#51cedf
hi PythonOperator guifg=#ddcb83
hi PythonStatement guifg=#c15fe1
hi PythonBuiltin guifg = #bd863d
hi Float guifg=#bd863d 
hi Boolean guifg=#bd863d
hi Conditional guifg=#c15fe1
hi String guifg=#89b866
hi Repeat guifg=#c15fe1
hi Exception guifg=#c15fe1
hi Constant guifg=#bd863d
hi Number guifg=#bd863d
hi Statement guifg=#bdbdbd
hi Label guifg=#bdbdbd
hi PreProc guifg=#c15fe1
hi ClsasStorage guifg=#bd863d
hi Structure guifg=#bd863d
hi Floaterm guifg=#bdbdbd
hi FloatermBorder guifg=#1f9638 guibg=#1c2022
hi EasyMotionShade guibg=#1c2022
hi EasyMotionTarget guifg=#69c924
hi PMenu guibg=#24292b
hi DiffText guibg=#00660a guifg=black
hi DiffAdd guibg=#34464f
hi DiffDelete guibg=#db2e4e guifg=#000000


"---------- Floaterm ----------
nnoremap <A-r> :FloatermNew lf<CR>
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


"----------------------  Deoplete ----------------------

" Use deoplete.
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option({
\   'ignore_case': v:true,
\   'smart_case': v:true,
\})
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
set splitbelow

" maximum candidate window length
call deoplete#custom#source('_', 'max_menu_width', 80)

"------------------------- jedi-vim ------------------------
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"


"--------------------- vim-hexokinase ----------------------
let g:Hexokinase_highlighters = ['backgroundfull']
"let g:Hexokinase_highlighters = ['foregroundfull']

"--------------------- Semshi ------------------------------
hi semshiSelected guifg=#8ff500 guibg=#262b2e gui=bold
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#b2b2b2
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#ffaf00
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#5fafff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#f5005e cterm=underline gui=underline

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>
