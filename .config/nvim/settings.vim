" ================================================ Basic Setting
syntax on                               " Enables syntax highlighing
set nocompatible      			 "Use Vim settings, rather then Vi settings. It’s important to have this onthe top of your file, as it influences other options
set lazyredraw
set history=1000		         " Set bigger history of executed commands
set showcmd			             " Show incomplete commands at the bottom
set noswapfile
set laststatus=2 			     " Always display the status bar 
set backspace=indent,eol,start   " Allow backspacing over indention
set hlsearch 
set title
set showmatch
set ignorecase
set hidden                              " Required to keep multiple buffers open multiple buffers
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file
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
filetype plugin on
set number
set autoindent                          " Good auto indent
set cursorline                          " Enable highlighting of the current line
"set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set clipboard=unnamedplus               " Copy paste between vim and everything else
set incsearch
let mapleader = "\<Space>"
set foldenable
set foldnestmax=1
set foldmethod=manual
set foldcolumn=2
set undofile                             " Maintain undo history between sessions
set path+=**                             " Finding files - Search down into subfolders
set exrc

augroup remember_folds
	autocmd!
	autocmd BufWinLeave * mkview
	autocmd BufWinEnter * silent! loadview
augroup END

" Show relative numbers only in normal mode and absolute number in insert mode
augroup toggle_relative_number
  autocmd!
  autocmd InsertEnter * :setlocal norelativenumber
  autocmd InsertLeave * :setlocal relativenumber
augroup END

:highlight LineNr ctermfg=grey          " Change color of line numbers to grey

augroup BgHighlight
  autocmd!
  autocmd WinEnter * set cul
  autocmd WinLeave * set nocul
augroup END

if &term =~ "screen"
  autocmd BufEnter * if bufname("") !~ "^?[A-Za-z0-9?]*://" | silent! exe '!echo -n "\ek[`hostname`:`basename $PWD`/`basename %`]\e\\"' | endif
  autocmd VimLeave * silent!  exe '!echo -n "\ek[`hostname`:`basename $PWD`]\e\\"'
endif

let fancy_symbols_enabled = 0

" incremental substitution (neovim)
if has('nvim')
  set inccommand=split
endif


" Suppress appending <PasteStart> and <PasteEnd> when pasting
set t_BE=

" File types -------------------------------
" JavaScript
au BufNewFile,BufRead *.es6 setf javascript
" TypeScript
au BufNewFile,BufRead *.tsx setf typescriptreact
" Markdown
au BufNewFile,BufRead *.md set filetype=markdown
" Flow
au BufNewFile,BufRead *.flow set filetype=javascript
" Python
au BufNewFile,BufRead *.py set filetype=python

set suffixesadd=.js,.es,.jsx,.json,.css,.less,.sass,.styl,.php,.py,.md




" ====================================================== KeyMap
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

"Quicker Escaping
:inoremap jk <esc>
:inoremap kj <esc>


" easily move a line up or down
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>
vnoremap <S-Down> :m '>+1<CR>gv=gv
vnoremap <S-UP> :m '<-2<CR>gv=gv


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



  " copy (write) highlighted text to clipboard
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')           

" Switch between tabs with ctrl 
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>

" Disable continuation of comments to the next line
:set formatoptions-=cro
nnoremap <Leader><Leader>w :w<CR> 	" Save file just by <Leaedr>w

nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !sudo tee > /dev/null %

" Open current directory
nmap te :tabedit 
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>



" Split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
" Move window
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Resize window
nmap <C-s><left> <C-w><
nmap <C-s><right> <C-w>>
nmap <C-s><up> <C-w>+
nmap <C-s><down> <C-w>-
