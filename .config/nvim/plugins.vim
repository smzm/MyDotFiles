call plug#begin('~/local/share/nvim/plugged')
	plug 'voldikss/vim-floaterm'                    " use terminal as a floating/popup window in neovim.
	plug 'jiangmiao/auto-pairs'                     " insert or delete brackets in pair
   	plug 'alvan/vim-closetag'                       " auto close (x)html tags
   	plug 'junegunn/goyo.vim'			            " distraction-free writing in vim
   	plug 'haya14busa/incsearch.vim'                 " improved incremental searching for vim 
   	plug 'haya14busa/incsearch-fuzzy.vim'           " incremantal fuzzy search extension for incsearch.vim
   	plug 'haya14busa/incsearch-easymotion.vim'      
	plug 'easymotion/vim-easymotion'
  	plug 'tpope/vim-repeat'				            " enable repeating supported plugin maps
	" plug 'yggdroot/indentline'	            		" a vim plugin to display the indention
	plug 'tpope/vim-fugitive'                       " git plugin for vim
	plug 'wadackel/vim-dogrun'						" dogrun theme
   	plug 'tpope/vim-commentary'                     " comment and uncomment stuff out
  	" plug 'numirias/semshi', {'do': ':updateremoteplugins'}
    plug 'shougo/context_filetype.vim'              " completion from other opened files
	plug 'machakann/vim-highlightedyank'			" make the yanked region apparent!
	plug 'mattn/emmet-vim' 							" emmet for vim
	plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' } " show colors
	plug 'tpope/vim-surround'						" provides mappings to easily delete, change and add such surroundings in pairs
	plug 'rhysd/clever-f.vim'						" extended f, f, t and t key mappings for vim. 
	plug 'andrewradev/tagalong.vim'					" change an html(ish) opening tag and take the closing one along as well
	" post install (yarn install | npm install) then load plugin only for editing supported files
    plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
	plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'} "live edit html, css, and javascript in vim
	plug '907th/vim-auto-save' 						" automatically save changes to disk in vim
    plug 'valloric/matchtagalways'                  " a vim plugin that always highlights the enclosing html/xml tags
    plug 'sindrets/diffview.nvim'                   "  diff mode 
    plug 'kyazdani42/nvim-web-devicons'             " lua `fork` of vim-web-devicons for neovim
    plug 'hoob3rt/lualine.nvim'                     " a blazing fast and easy to configure neovim statusline written in pure lua.
    plug 'neovim/nvim-lspconfig'
    plug 'hrsh7th/nvim-compe'
    plug 'glepnir/lspsaga.nvim'
    plug 'folke/lsp-colors.nvim'
	plug 'onsails/lspkind-nvim'
    plug 'nvim-lua/completion-nvim'
    plug 'kristijanhusak/defx-git'
    plug 'kristijanhusak/defx-icons'
    plug 'shougo/defx.nvim', { 'do': ':updateremoteplugins' }
    plug 'nvim-telescope/telescope.nvim'
    plug 'nvim-lua/popup.nvim'
    plug 'nvim-lua/plenary.nvim'
    plug 'nvim-treesitter/nvim-treesitter', { 'do': ':tsupdate' }
    plug 'shaunsingh/nord.nvim'
    plug 'rafamadriz/friendly-snippets'	            " set of preconfigured snippets for different languages. 
    plug 'hrsh7th/vim-vsnip'
    plug 'vimwiki/vimwiki'                        " personal wiki for vim
    plug 'groenewege/vim-less', { 'for': 'less' }
    plug 'kabouzeid/nvim-lspinstall'


call plug#end()


let g:python3_host_prog = expand('/usr/bin/python3.9')

" ========== theme ==========

colorscheme nord
source ~/.config/nvim/theme/nordtheme.vim



"---------- floaterm ----------
let g:floaterm_title='terminal($1|$2)'
let g:floaterm_wintype='float'
let g:floaterm_width=0.5
let g:floaterm_height=1.0
let g:floaterm_position='topright'

nnoremap <a-f> :floatermnew --position=center lf <cr>
nnoremap <a-t> :floatermnew<cr>
let g:floaterm_keymap_prev   = '<f9>'
let g:floaterm_keymap_next   = '<f10>'
let g:floaterm_keymap_toggle = '<f12>'				" start with floaterm and lf command



" run <floaterm lf> just if ran nvim without any argument
let g:vimarguments = execute("args")
if len(g:vimarguments) == 0
	autocmd vimenter * floatermnew --position=center lf  
endif

" binding f5 to save and run python code inside floaterm window
:function runpython()
	:execute "w"
	:floatermnew clear && python3 %:p
:endfunction

nnoremap <f5> :call runpython()<cr>
inoremap <f5> <esc> :call runpython()<cr>


" ----------- auto-pair -------------
" jump outside '"({
if !exists('g:autopairsshortcutjump')
  let g:autopairsshortcutjump = ',,'
endif


" ---------- closetag ----------
" filenames like *.xml, *.html, *.xhtml, ...
" these are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" this will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" these are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" this will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" this will make the list of non-closing tags case-sensitive (e.g. `<link>` will be closed while `<link>` won't.)
"
let g:closetag_emptytags_casesensitive = 1

" dict
" disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxregion,tsxregion',
    \ 'javascript.jsx': 'jsxregion',
    \ }

" shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'



"---------- devicon ----------
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
let g:webdeviconsunicodeglyphdoublewidth = 1

" the amount of space to use after the glyph character (default ' ')
let g:webdeviconsnerdtreeafterglyphpadding = '  '



" ---------- goyo ----------
function! s:goyo_enter()
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd quitpre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!

"	if executable('tmux') && strlen($tmux)
"		silent !tmux set status off
"		silent !tmux list-panes -f '\#f' | grep -q z || tmux resize-pane -z
"	endif
    set noshowmode
    set noshowcmd
    set scrolloff=999
    "limelight
     " ...
endfunction

function! s:goyo_leave()
	  " quit vim if this is the only remaining buffer
	  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
	       if b:quitting_bang
	         qa!
	       else
	         qa
	       endif
	  endif
"	  if executable('tmux') && strlen($tmux)
"		  silent !tmux set status on
"	          silent !tmux list-panes -f '\#f' | grep -q z && tmux resize-pane -z
"	  endif
	  set showmode
	  set showcmd
	  set scrolloff=5
	  "limelight!
	  " ... 
endfunction

autocmd! user goyoenter call <sid>goyo_enter()
autocmd! user goyoleave call <sid>goyo_leave()
"nnoremap <f6> :goyo <cr>



" ------------- easymotion --------------
let g:easymotion_do_mapping = 0 " disable default mappings

" jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <plug>(easymotion-overwin-f)

" turn on case-insensitive feature
let g:easymotion_smartcase = 1

" jk motions: line motions
map <leader>j <plug>(easymotion-j)
map <leader>k <plug>(easymotion-k)

" move to word
map  <leader>w <plug>(easymotion-bd-w)
map <leader>w <plug>(easymotion-overwin-w)

" search with / using easymotion
map  / <plug>(easymotion-sn)
omap / <plug>(easymotion-tn)

" these `n` & `n` mappings are options. you do not have to map `n` & `n` to
" easymotion.
" without these mappings, `n` & `n` works fine. (these mappings just provide
" different highlight method and have some other features )
map  n <plug>(easymotion-next)
map  n <plug>(easymotion-prev)

" require tpope/vim-repeat to enable dot repeat support
" jump to anywhere with only `s{char}{target}`
" `s<cr>` repeat last find motion.
nmap s <plug>(easymotion-s)
" bidirectional & within line 't' motion
omap t <plug>(easymotion-bd-tl)
" use uppercase target labels and type as a lower case
let g:easymotion_use_upper = 1
"  " type `l` and match `l`&`l`
let g:easymotion_smartcase = 1
" smartsign (type `3` and match `3`&`#`)
let g:easymotion_use_smartsign_us = 1



"-------  fuzzy-search with easymotion+incsearch -------
function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
    \   'converters': [incsearch#config#fuzzyword#converter()],
    \   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
    \   'keymap': {"\<cr>": '<over>(easymotion)'},
    \   'is_expr': 0,
    \   'is_stay': 1
    \ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <space>/ incsearch#go(<sid>config_easyfuzzymotion())



"------------------ indentline ------------------------
" let g:indentline_color_gui = '#2d3541'
" let g:indentline_char_list = ['.']



"---------------------- commentary ---------------------
" map ctrl + / to comment and uncomment with commantary
map <c-_> gc


"----------------------- semshi -------------------------
hi semshiselected guifg=#8ff500 guibg=#262b2e gui=bold
hi semshilocal           ctermfg=209 guifg=#ff875f
hi semshiglobal          ctermfg=214 guifg=#808080
hi semshiimported        ctermfg=214 guifg=#e37900 cterm=bold gui=bold
hi semshiparameter       ctermfg=75  guifg=#e34c00
hi semshiparameterunused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshifree            ctermfg=218 guifg=#db0071
hi semshibuiltin         ctermfg=207 guifg=#0088e3
hi semshiattribute       ctermfg=49  guifg=#00b58e
hi semshiself            ctermfg=249 guifg=#fc0384
hi semshiunresolved      ctermfg=226 guifg=#f5005e cterm=underline gui=underline

hi semshierrorsign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshierrorchar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshierror text=e> texthl=semshierrorsign

nmap <silent> <tab> :semshi goto name next<cr>
nmap <silent> <s-tab> :semshi goto name prev<cr>


"--------------------- vim-hexokinase ----------------------
let g:hexokinase_highlighters = ['backgroundfull']
"let g:hexokinase_highlighters = ['foregroundfull']


"-------------------------- emmet --------------------------
" redefine trigger key : remap the default <c-y> leader
let g:user_emmet_leader_key='.'  " >>> (,) still needs to be entered

"enable just for html/css
let g:user_emmet_install_global = 0
autocmd filetype html,css emmetinstall


"-------------------------------- pretier -----------------------------------------
" let g:prettier#autoformat = 1


"------------------------------- vim-auto-save ------------------------------------
let g:auto_save = 1  " enable autosave on vim startup
let g:auto_save_silent = 1  " do not display the auto-save notification
let g:auto_save_events = ["insertleave", "textchanged"]



"--------------------------------------- compe -------------------------------------
inoremap <silent><expr> <c-space> compe#complete()
inoremap <silent><expr> <cr>      compe#confirm('<cr>')
inoremap <silent><expr> <c-e>     compe#close('<c-e>')
inoremap <silent><expr> <c-f>     compe#scroll({ 'delta': +4 })
inoremap <silent><expr> <c-d>     compe#scroll({ 'delta': -4 })
set completeopt=menuone,noselect


"--------------------------------------- lspsaga------------------------------------
nnoremap <silent> <c-j> <cmd>lspsaga diagnostic_jump_next<cr>
nnoremap <silent>k <cmd>lspsaga hover_doc<cr>
inoremap <silent> <c-k> <cmd>lspsaga signature_help<cr>
nnoremap <silent> gh <cmd>lspsaga lsp_finder<cr>


" ---------------------------------- telescope ------------------------------------
nnoremap <silent> ;f <cmd>telescope find_files<cr>
nnoremap <silent> ;r <cmd>telescope live_grep<cr>
nnoremap <silent> \\ <cmd>telescope buffers<cr>
nnoremap <silent> ;; <cmd>telescope help_tags<cr>


" ---------------------------------- fugitive --------------------------------------
" status line
if !exists('*fugitive#statusline')
  set statusline=%f\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}[l%l/%l,c%03v]
  set statusline+=%=
  set statusline+=%{fugitive#statusline()}
endif

cnoreabbrev g git
cnoreabbrev gopen gbrowse

" ----------------------------------- defx ----------------------------------------- 
" define mappings
"cnoreabbrev sf defx -listed -new
"      \ -columns=indent:mark:icon:icons:filename:git:size
"      \ -buffer-name=tab`tabpagenr()`<cr>
nnoremap <silent>sf :<c-u>defx -listed -resume
      \ -columns=indent:mark:icon:icons:filename:git:size
      \ -buffer-name=tab`tabpagenr()`
      \ `expand('%:p:h')` -search=`expand('%:p')`<cr>
nnoremap <silent>fi :<c-u>defx -new `expand('%:p:h')` -search=`expand('%:p')`<cr>

autocmd filetype defx call s:defx_my_settings()
	function! s:defx_my_settings() abort
	  " define mappings
	  nnoremap <silent><buffer><expr> <cr>
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('copy')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('move')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('paste')
	  nnoremap <silent><buffer><expr> l
	  \ defx#do_action('open')
	  nnoremap <silent><buffer><expr> e
	  \ defx#do_action('open', 'vsplit')
	  nnoremap <silent><buffer><expr> p
	  \ defx#do_action('open', 'pedit')
	  nnoremap <silent><buffer><expr> o
	  \ defx#do_action('open_or_close_tree')
	  nnoremap <silent><buffer><expr> k
	  \ defx#do_action('new_directory')
	  nnoremap <silent><buffer><expr> n
	  \ defx#do_action('new_file')
	  nnoremap <silent><buffer><expr> m
	  \ defx#do_action('new_multiple_files')
	  nnoremap <silent><buffer><expr> c
	  \ defx#do_action('toggle_columns',
	  \                'mark:indent:icon:filename:type:size:time')
	  nnoremap <silent><buffer><expr> s
	  \ defx#do_action('toggle_sort', 'time')
	  nnoremap <silent><buffer><expr> d
	  \ defx#do_action('remove')
	  nnoremap <silent><buffer><expr> r
	  \ defx#do_action('rename')
	  nnoremap <silent><buffer><expr> !
	  \ defx#do_action('execute_command')
	  nnoremap <silent><buffer><expr> x
	  \ defx#do_action('execute_system')
	  nnoremap <silent><buffer><expr> yy
	  \ defx#do_action('yank_path')
	  nnoremap <silent><buffer><expr> .
	  \ defx#do_action('toggle_ignored_files')
	  nnoremap <silent><buffer><expr> ;
	  \ defx#do_action('repeat')
	  nnoremap <silent><buffer><expr> h
	  \ defx#do_action('cd', ['..'])
	  nnoremap <silent><buffer><expr> ~
	  \ defx#do_action('cd')
	  nnoremap <silent><buffer><expr> q
	  \ defx#do_action('quit')
	  nnoremap <silent><buffer><expr> <space>
	  \ defx#do_action('toggle_select') . 'j'
	  nnoremap <silent><buffer><expr> *
	  \ defx#do_action('toggle_select_all')
	  nnoremap <silent><buffer><expr> j
	  \ line('.') == line('$') ? 'gg' : 'j'
	  nnoremap <silent><buffer><expr> k
	  \ line('.') == 1 ? 'g' : 'k'
	  nnoremap <silent><buffer><expr> <c-l>
	  \ defx#do_action('redraw')
	  nnoremap <silent><buffer><expr> <c-g>
	  \ defx#do_action('print')
	  nnoremap <silent><buffer><expr> cd
	  \ defx#do_action('change_vim_cwd')
	endfunction

call defx#custom#column('icon', {
      \ 'directory_icon': '▸',
      \ 'opened_icon': '▾',
      \ 'root_icon': ' ',
      \ })
call defx#custom#column('git', 'indicators', {
  \ 'modified'  : 'm',
  \ 'staged'    : '✚',
  \ 'untracked' : '✭',
  \ 'renamed'   : '➜',
  \ 'unmerged'  : '═',
  \ 'ignored'   : '☒',
  \ 'deleted'   : '✖',
  \ 'unknown'   : '?'
  \ })

" -------------------------------------- lua ---------------------------------------
luafile ~/.config/nvim/lua-plugins/lspconfig.lua
luafile ~/.config/nvim/lua-plugins/lualine.lua
luafile ~/.config/nvim/lua-plugins/compe.lua
luafile ~/.config/nvim/lua-plugins/lspsaga.lua
luafile ~/.config/nvim/lua-plugins/telescope.lua
luafile ~/.config/nvim/lua-plugins/lspcolors.lua
luafile ~/.config/nvim/lua-plugins/treesitter.lua
luafile ~/.config/nvim/lua-plugins/webdevicons.lua
