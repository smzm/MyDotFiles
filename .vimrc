call plug#begin('~/.vim/plugged')


"-------------------------------------------indentLine-------------------------------------------
Plug 'Yggdroot/indentLine'		"Display the indention levels with thin vertical lines [more on https://github.com/Yggdroot/indentLine]
"------------------------------------------------------------------------------------------------



"---------------------------------------------NERDTree-------------------------------------------
Plug 'scrooloose/nerdtree'		"File drawer, open with :NERDTreeToggle [more on https://github.com/scrooloose/nerdtree]
"------------------------------------------------------------------------------------------------


"----------------------------------------nerdtree-git-plugin-------------------------------------
Plug 'Xuyuanp/nerdtree-git-plugin'		"A plugin of NERDTree showing git status flags [more on https://github.com/Xuyuanp/nerdtree-git-plugin]
"------------------------------------------------------------------------------------------------



"----------------------------------------YouCompleteMe-------------------------------------------
"At first install Vim with Brew to support python : {brew install vim --with-override-system-vi}
"After install Cmake
Plug 'Valloric/YouCompleteMe', { 'do': 'python3 ./install.py --all' } " [more on https://github.com/Valloric/YouCompleteMe]
"------------------------------------------------------------------------------------------------



"---------------------------------------------Prettier-------------------------------------------
" At first install Yarn and NPM [more on https://github.com/prettier/vim-prettier]

Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install'}

" run npm install prettier -g
" in VIM --> :PrettierAsync
"------------------------------------------------------------------------------------------------



"-----------------------------------------Multiple-cursors---------------------------------------
Plug 'terryma/vim-multiple-cursors'		"True Sublime Text style multiple selections for Vim [more on https://github.com/terryma/vim-multiple-cursors]
"------------------------------------------------------------------------------------------------

"------------------------------------------ Easy Motion ---------------------------------------
Plug 'easymotion/vim-easymotion'         "Vim motions on speed!  [https://github.com/easymotion/vim-easymotion]
"----------------------------------------------------------------------------------------------
"------------------------------------------NERDCommenter-----------------------------------------
Plug 'scrooloose/nerdcommenter'		"Comment functions so powerful—no comment necessary. [more on https://github.com/scrooloose/nerdcommenter]
" Please see the vim help system for full documentation of all options----> :help nerdcommenter
"------------------------------------------------------------------------------------------------



"-------------------------------------------vim-gitgutter----------------------------------------
"Plug 'airblade/vim-gitgutter'		"A Vim plugin which shows a git diff in the gutter. [usage on https://github.com/airblade/vim-gitgutter]
"------------------------------------------------------------------------------------------------



"-------------------------------------------vim-airline------------------------------------------
Plug 'vim-airline/vim-airline'		"Lean & mean status/tabline for vim that's light as air.[themes and usages on https://github.com/vim-airline/vim-airline]

"For the nice looking powerline symbols to appear, you will need to install a patched font:[https://github.com/powerline/fonts]
"------------------------------------------------------------------------------------------------



"-----------------------------------------vim-airline-themes-------------------------------------
Plug 'vim-airline/vim-airline-themes'		"A collection of themes for vim-airline [more on https://github.com/vim-airline/vim-airline-themes]
"------------------------------------------------------------------------------------------------



"---------------------------------------------emmet-vim------------------------------------------
Plug 'mattn/emmet-vim'		"Emmet for vim [more on https://github.com/mattn/emmet-vim]
"------------------------------------------------------------------------------------------------



"------------------------------------------deoplete-ternjs---------------------------------------
Plug 'carlitux/deoplete-ternjs'		"[more on https://github.com/carlitux/deoplete-ternjs]
"------------------------------------------------------------------------------------------------



"--------------------------------------------UltiSnips-------------------------------------------
Plug 'SirVer/ultisnips'		"The ultimate snippet solution for Vim [more on https://github.com/SirVer/ultisnips and http://vimcasts.org/episodes/meet-ultisnips/]
"------------------------------------------------------------------------------------------------


"-----------------------------------snipMate & UltiSnip Snippets---------------------------------
Plug 'honza/vim-snippets'		"This repository contains snippets files for various programming languages. [more on https://github.com/honza/vim-snippets]
"------------------------------------------------------------------------------------------------


"---------------------------------------------supertab-------------------------------------------
Plug 'ervandew/supertab'		"Perform all your vim insert mode completions with Tab [more on https://github.com/ervandew/supertab]
"------------------------------------------------------------------------------------------------



"-----------------------------------------vim-devicons-------------------------------------------
"Install a Nerd Font compatible font first.[More on https://github.com/ryanoasis/vim-devicons]  
Plug 'ryanoasis/vim-devicons'		"Adds icons fir vim plugins like NERDTree
"------------------------------------------------------------------------------------------------



"---------------------------------------------Completor------------------------------------------
"Plug 'maralla/completor.vim'		"Async completion framework made ease. [more on https://github.com/maralla/completor.vim]
"------------------------------------------------------------------------------------------------



"--------------------------------------------Vim-css-color---------------------------------------
Plug 'https://github.com/ap/vim-css-color.git'    "A very fast, multi-syntax context-sensitive color name highlighter [more on https://github.com/ap/vim-css-color]
"------------------------------------------------------------------------------------------------



"--------------------------------------------tmuxline.vim----------------------------------------
Plug 'edkolev/tmuxline.vim'
"------------------------------------------------------------------------------------------------



"--------------------------------------------Surround--------------------------------------------
Plug 'https://github.com/tpope/vim-surround.git'         "Surround.vim is all about surroundings parentheses, brackets, quotes, XML tags, and more [more in https://github.com/tpope/vim-surround]"
"------------------------------------------------------------------------------------------------



"------------------------------------------------fzf---------------------------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'  "[more on https://github.com/junegunn/fzf.vim]
"------------------------------------------------------------------------------------------------



"-----------------------------------------Vim Tmux Navigator--------------------------------------
Plug 'christoomey/vim-tmux-navigator'       "Seamless navigation between tmux panes and vim splits [more in https://github.com/christoomey/vim-tmux-navigator]
"-------------------------------------------------------------------------------------------------



"--------------------------------------------Terminus---------------------------------------------
Plug 'https://github.com/wincent/terminus.git'      "Terminus enhances Vim's and Neovim's integration [more on https://github.com/wincent/terminus]
"-------------------------------------------------------------------------------------------------


"----------------------------------------vim-highlightedyank--------------------------------------
Plug 'https://github.com/machakann/vim-highlightedyank.git'
"-------------------------------------------------------------------------------------------------

"----------------------------------------cheat.sh-------------------------------------------------
Plug 'dbeniamine/cheat.sh-vim'
"-------------------------------------------------------------------------------------------------

"JAVASCRIPT'S PLUGINS --------------------------------- JAVASCRIPT'S PLUGINS -------------------------------- JAVASCRIPT'S PLUGINS
Plug 'pangloss/vim-javascript' "Javascript syntax highlighting and indentation improvement										"|
Plug 'mxw/vim-jsx' " Syntax highlighting and indenting for JSX																	"|
Plug 'jelera/vim-javascript-syntax' "Enhanced JavaScript Syntax for Vim															"|
Plug 'leafgarland/typescript-vim' " TypeScript plugin																			"|
"---------------------------------------------------------------------------------------------------------------------------------



"THEMES ---------------------------------------------------------- THEMES ------------------------------------------------- THEMES
Plug 'sheerun/vim-polyglot' " A collection of language packs for Vim															"|
Plug 'trevordmiller/nova-vim' " Nova color scheme plugin for Vim																"|		
"---------------------------------------------------------------------------------------------------------------------------------



call plug#end()





" --------------------------------------------------------- SETUP CONFIGURATION -------------------------------------------------------
:set nocompatible
syntax on
:set wrap
:nnoremap j gj
:nnoremap k gk
:set encoding=utf-8
":set number
highlight LineNr ctermfg=DarkGray
:nmap <C-N><C-N> :set invnumber<CR> 
:set numberwidth=3
:set ruler

" Set Proper Tabs
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set expandtab

" Always display the status line
"set laststatus=2

:set ignorecase " case insensitive searching
:set smartcase " case-sensitive if expresson contains a capital letter
:set hlsearch
:set incsearch " set incremental search, like modern browsers
:set nolazyredraw " don't redraw while executing macros

:set magic " Set magic on, for regex

:set showmatch " show matching braces
:set mat=2 " how many tenths of a second to blink

" switch syntax highlighting on
syntax enable
:set autoindent " automatically set indent of new line
:set smartindent

:set shiftwidth=4 " Set shiftwidth to control how many columns text is indented with the reindent operations (<< and >>) and automatic C-style indentation. 
:set t_Co=256 " makes Vim use 256 colors

:set nocp " This changes the values of a LOT of options, enabling features which are not Vi compatible but really really nice
:set clipboard=unnamed
:set clipboard=unnamedplus
:set noswapfile " Avoid swap files
:set mouse=a " Mouse Integration

" auto complete for ( , " , ' , [ , { 
:inoremap        (  ()<Left>
:inoremap        "  ""<Left>
:inoremap        `  ``<Left>
:inoremap        '  ''<Left>
:inoremap        [  []<Left>
:inoremap      {  {}<Left>

" auto comment and uncooment with F6 and F7 key
:autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
:autocmd FileType sh,ruby,python   let b:comment_leader = '# '
:noremap <silent> #6 :<C-B>silent
"commenting line with F6
:noremap <silent> #7 :<C-B>silent
"uncommenting line with F7

:noremap <silent> #5 :!konsole --hold -e 'python ./%' <CR> <CR>" execute python script with F5
:set pastetoggle=<F2> " Paste mode toggle with F2 Pastemode disable auto-indent and bracket auto-compelation and it helps you to paste code fro elsewhere .

set bs=2


" code folding settings
set foldmethod=syntax " fold based on indent
set foldnestmax=10 " deepest fold is 10 levels
set nofoldenable " don't fold by default
set foldlevel=1

" Disable Arrow key movement
map <up> <nop>
map <up> <nop>
map <right> <nop>
map <left> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

"just use ; for writing command without pressing shift
nnoremap ; :

"Save file when focus changed
au FocusLost * :wa

"change the <leader> key to ;
let mapleader = " "

"Avoid wrapping a line in the middle of a word.
set linebreak


"Quicker Escaping
inoremap jj <ESC>

"----------------------------------------Leader Mapped
"strip all trailing whitespace in the current file
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"CSS properties sorted
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

"reselect the text that was just pasted
nnoremap <leader>v V`]

"open up ~/.vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr> 


nnoremap <Leader><space> :noh<cr>



"================NEOVIM================
":set inccommand=nosplit "For Highlighting in Substution
"======================================

"---------------------------------------------NERDTree's Configuration-------------------------------------------
" NERDTree automatically starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"Specific key or shortcut to open NERDTree : CTRL + n
map <C-o> :NERDTreeToggle<CR>

"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Close Nerdtree automatically after file opend
let NERDTreeQuitOnOpen = 1

" show hidden files in NERDTree
let NERDTreeShowHidden=1

" Toggle NERDTree
nmap <silent> <leader>k :NERDTreeToggle<cr>

" expand to the path of the file in the current buffer
nmap <silent> <leader>y :NERDTreeFind<cr>
"-------------------------------------------------------------------------------------------------------------------





"---------------------------------------------vim-devicons's Configuration------------------------------------------
" loading the plugin
let g:webdevicons_enable = 1

" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 1

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

" whether or not to show the nerdtree brackets around flags
let g:webdevicons_conceal_nerdtree_brackets = 1

" the amount of space to use after the glyph character (default ' ')
let g:WebDevIconsNerdTreeAfterGlyphPadding = '  '

" Force extra padding in NERDTree
let g:WebDevIconsNerdTreeGitPluginForceVAlign = 1

set guifont=DroidSansMono_Nerd_Font:h11
"-------------------------------------------------------------------------------------------------------------------





"---------------------------------------------YouCompleteMe's Configuration------------------------------------------
" Start autocompletion after 4 chars
let g:ycm_min_num_of_chars_for_completion = 4 
let g:ycm_min_num_identifier_candidate_chars = 4
let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
"---------------------------------------------------------------------------------------------------------------------





"--------------------------------------------- vim-vertical-line's Configuration------------------------------------------
let g:indentLine_char = '.'
let g:indentLine_color_term = 5 
"-------------------------------------------------------------------------------------------------------------------------





"---------------------------------------------airline's Configuration------------------------------------------
let g:airline_theme='violet' " set airline plugin theme
let g:airline#extensions#tabline#enabled = 1 " showing tabs 

" air-line
 let g:airline_powerline_fonts = 1

 if !exists('g:airline_symbols')
    :let g:airline_symbols = {}
 endif



  " unicode symbols
  let g:airline_left_sep = '»'
  let g:airline_left_sep = '▶'
  let g:airline_right_sep = '«'
  let g:airline_right_sep = '◀'
  let g:airline_symbols.crypt = '🔒'
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.maxlinenr = ''
  let g:airline_symbols.maxlinenr = '㏑'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.spell = 'Ꞩ'
  let g:airline_symbols.notexists = 'Ɇ'
  let g:airline_symbols.whitespace = 'Ξ'

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.maxlinenr = ''

"vim-airline-clock 
let g:airline#extensions#clock#format = '%c'

let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_theme = 'icebert'

let g:tmuxline_powerline_separators = 0

"-------------------------------------------------------------------------------------------------------------------





"---------------------------------------------Emmet's Configuration------------------------------------------
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
"------------------------------------------------------------------------------------------------------------





"---------------------------------------------UltiSnips (using supertab)'s Configuration------------------------------------------
 "YouCompleteMe and UltiSnips compatibility, with the helper of supertab
 "(via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:UltiSnipsSnippetsDir = "~/.vim/plugged/ultisnips/UltiSnips"
"-----------------------------------------------------------------------------------------------------------------------------------



"-----------------------------------------------------easy motion's Configuration----------------------------------------------------
nmap <leader>s <Plug>(easymotion-overwin-f2)
"------------------------------------------------------------------------------------------------------------------------------------




"-----------------------------------------------Vim Tmux Navigator's Configuration -------------------------------------
if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

"-----------------------------------------------------------------------------------------------------------------------



