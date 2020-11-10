call plug#begin('~/local/share/nvim/plugged')
	Plug 'voldikss/vim-floaterm'                    " Use terminal as a floating/popup window in neovim.
	Plug 'jiangmiao/auto-pairs'                     " insert or delete brackets in pair
 	Plug 'vim-airline/vim-airline'	 	            " status/tabline for vim
 	Plug 'vim-airline/vim-airline-themes'
	Plug 'neovim/nvim-lspconfig'			        " Nvim LSP client
	Plug 'nvim-lua/completion-nvim'		        	" A async completion to neovim's built in LSP
	Plug 'nvim-lua/diagnostic-nvim'			        " A wrapper for neovim built in LSP diagnosis config
	Plug 'vuciv/vim-bujo'				            " A minimalist task manager for vim
    Plug 'norcalli/nvim-colorizer.lua'              " Color highlighter
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
	Plug 'lifepillar/vim-gruvbox8'			        " gruvbox Theme
	Plug 'wadackel/vim-dogrun'
	Plug 'arzg/vim-colors-xcode'



call plug#end()

"------------- Theme ----------
colorscheme dogrun
"colorscheme xcodedarkhc

let g:airline_theme = "hybrid"

"Highlight search color 
hi Search cterm=NONE ctermfg=black ctermbg=yellow


" ---------- Floaterm ----------
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
nnoremap <F8> :Goyo<CR>

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


" --------------------- LSP ------------------------
lua << EOF
require'nvim_lsp'.pyls.setup{}
EOF

set completeopt-=preview

" use omni completion provided by lsp
autocmd Filetype python setlocal omnifunc=v:lua.vim.lsp.omnifunc

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

lua require'nvim_lsp'.pyls.setup{on_attach=require'completion'.on_attach}

nnoremap <silent> <c-]> <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K     <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr    <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd    <cmd>lua vim.lsp.buf.declaration()<CR>


"---------------- Completion-nvim ------------------
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']


"specify keyword length for triggering completion
let g:completion_trigger_keyword_length = 3

"------------------ Diagnostic-nvim ------------------

lua << EOF
local on_attach_vim = function(client)
  require'completion'.on_attach(client)
  require'diagnostic'.on_attach(client)
end
require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
EOF

let g:diagnostic_enable_virtual_text = 1
let g:space_before_virtual_text = 5
let g:diagnostic_insert_delay = 1
let g:diagnostic_auto_popup_while_jump = 1

"------------------ indentLine ------------------------
let g:indentLine_color_term = 239


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

