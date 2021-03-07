set nocompatible       "Use Vim settings, rather then Vi settings. It’s important to have this onthe top of your file, as it influences other options
set lazyredraw
set history=1000	" Set bigger history of executed commands
set showcmd		" Show incomplete commands at the bottom
set noswapfile
set laststatus=2 	" Always display the status bar 
set backspace=indent,eol,start    " Allow backspacing over indention
set hlsearch 
set autoindent
set title
set showmatch
set ignorecase
set formatoptions-=cro                  " Stop newline continution of comments
syntax on                               " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
"set ruler     		                " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set shiftwidth=2
set tabstop=4
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set scrolloff=3 			"The number of screen lines to keep above and below the cursor
set sidescrolloff=5			"The number of screen columns to keep to the left and right of thecursor
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set smartcase
set wildmenu
set wildmode=list:longest,full

" Show relative numbers only in normal mode and absolute number in insert mode
augroup toggle_relative_number
  autocmd!
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END

set number
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
"set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
let mapleader = "\<Space>"
nnoremap <Leader><Leader>w :w<CR> 	" Save file just by <Leaedr>w
set foldenable
set foldnestmax=1
set foldmethod=manual
set foldcolumn=2
augroup remember_folds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END


:highlight LineNr ctermfg=grey          " Change color of line numbers to grey


" Fix indenting visual block
 vmap < <gv
 vmap > >gv

"just use ; for writing command without pressing shift
nnoremap ; :

" Save file as sudo when no sudo permissions
 cmap w!! w !sudo tee > /dev/null %

" Shortcutting split navigation
 map <A-h> <C-w>h
 map <A-j> <C-w>j
 map <A-k> <C-w>k
 map <A-l> <C-w>l

" Tab shortcuts
 nnoremap <A-p> :tabp<CR>
 nnoremap <A-n> :tabn<CR>

"Save file when focus changed
:au FocusLost * silent! wa

"Quicker Escaping
:inoremap jk <esc>



" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd!
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" easily move a line up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-UP> :m '<-2<CR>gv=gv

" Vim highlight line
set cursorline

" Line number

" For jumping to the end of prantheses and quotes when write a string just
" with C+e
inoremap <C-e> <C-o>A

"turn off highlighting after search with esc esc
nnoremap <esc><esc> :silent! nohls<cr>

" work properly with ctags
set tags=tags;
" Regenerate tags when saving Python files.
augroup Retags
  autocmd!
  autocmd BufWritePost *.py silent! !ctags -R &
  autocmd BufWritePost *.js silent! !ctags -R &
augroup END

" map Leader+" for wraping a sentences inside () in " == usefull for python
nnoremap <Leader>' vi)<esc>a"<esc>l%a"<esc>


let fancy_symbols_enabled = 0



