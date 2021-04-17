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
	"Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " Show colors
	Plug 'tpope/vim-surround'						" provides mappings to easily delete, change and add such surroundings in pairs
	Plug 'neoclide/coc.nvim', {'branch': 'release'} " Intelisense
	Plug 'rhysd/clever-f.vim'						" Extended f, F, t and T key mappings for Vim. 
	Plug 'AndrewRadev/tagalong.vim'					" Change an HTML(ish) opening tag and take the closing one along as well
	Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} "live edit html, css, and javascript in vim

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


""----------------------  Deoplete ----------------------

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

"-------------------------- Emmet --------------------------
" Redefine trigger key : remap the default <C-Y> leader
let g:user_emmet_leader_key=','  " >>> (,) still needs to be entered


"--------------------------- COC ---------------------------
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" Use <cr> to confirm completion
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
