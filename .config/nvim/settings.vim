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
set noexpandtab
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
set termguicolors

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


set shortmess+=c 

" ====================================================== KeyMap
" Fix indenting visual block
" for visual mode
vmap <S-Tab> <gv
vmap <Tab> >gv

nnoremap <Tab> >>
nnoremap <S-Tab> <<

" for insert mode
inoremap <S-Tab> <C-d>


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


" easily move a line up or down

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

" For Visually selected text use <<vim-textmanip>> plugin 
" vnoremap <S-Down> :m '>+1<CR>gv=gv
" vnoremap <S-UP> :m '<-2<CR>gv=gv



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

" gf open in a newtab
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf

" <leader>* for match all pattern under cursor
nnoremap <expr> <leader>* ':%s/'.expand('<cword>').'//gn<CR>``'


" copy (write) highlighted text to clipboard
autocmd TextYankPost * call system('echo '.shellescape(join(v:event.regcontents, "\<CR>")).' |  clip.exe')           

" Switch between tabs with ctrl 
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-j> :tabprevious<CR>                                                                            
nnoremap <C-k> :tabnext<CR>

" Disable continuation of comments to the next line
:set formatoptions-=cro

nnoremap x "_x

" Increment/decrement
nnoremap + <C-a>
nnoremap - <C-x>

" Delete a word backwards
nnoremap dw vb"_d

" Select all
nmap <C-a> gg<S-v>G

" Save with root permission
command! W w !tee %

" Open current directory
nmap te :tabedit 


" open splitted tab to a new window
nnoremap ww <C-w>T 


"Split window
nmap s- :split<Return><C-w>w
nmap s\| :vsplit<Return><C-w>w
" Move window
map w<left> <C-w>h
map w<up> <C-w>k
map w<down> <C-w>j
map w<right> <C-w>l
map wh <C-w>h
map wk <C-w>k
map wj <C-w>j
map wl <C-w>l
" Resize window
nmap <C-w><right> :vertical resize +4<CR>
nmap <C-w><left> :vertical resize -4<CR>
nmap <C-w><up> :resize +2<CR>
nmap <C-w><down> :resize -2<CR>

" Undo Breakpoint
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ! !<c-g>u
inoremap ? ?<c-g>u
inoremap ' '<c-g>u
inoremap " "<c-g>u
inoremap ( (<c-g>u
inoremap ) )<c-g>u
inoremap [ [<c-g>u
inoremap ] ]<c-g>u
inoremap { {<c-g>u
inoremap } }<c-g>u
inoremap & &<c-g>u
inoremap = =<c-g>u
inoremap / /<c-g>u


nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
