set hlsearch 
set autoindent
set showmatch
set ignorecase
set formatoptions-=cro                  " Stop newline continution of comments
syntax on                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
set ruler              			            " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set shiftwidth=2
set tabstop=2
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set smartcase
set number relativenumber               " Show numbers relative to current line
set autoindent                          " Good auto indent
set laststatus=2                        " Always display the status line
set cursorline                          " Enable highlighting of the current line
"set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=100                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
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
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" easily move a line up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>


