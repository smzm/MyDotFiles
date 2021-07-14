"------------- Theme ----------
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"Highlight search color 
hi Search guibg=#c7ac00
hi Normal guibg=#22262e guifg=#97AFC4
hi LineNr guifg=#2f333b
hi CursorLineNr guifg=#585d67
hi CursorLine guibg=#29303b
hi Comment gui=italic
" hi Comment guifg=#626262

hi pythonStatement guifg=#8bb5c9 gui=italic
hi pythonFunction guifg=#c4975a gui=italic,bold
hi pythonConditional guifg=#eb7c7c gui=italic
hi pythonRepeat guifg=#eb7c7c gui=italic
hi pythonException guifg=#eb7c7c gui=italic
hi pythonOperator guifg=#cf8a96
hi pythonInclude guifg=#C46a8f gui=italic
" hi pythonAsync
" hi pythonDecorator
" hi pythonDecoratorName
" hi pythonDoctestValue
" hi pythonMatrixMultiply
" hi pythonTodo
" hi pythonComment
" hi pythonEscape
hi pythonQuotes guifg=#678f6d
hi pythonString guifg=#678f6d
hi pythonFString guifg=#678f6d
" hi pythonTripleQuotes
" hi pythonSpaceError
" hi pythonDoctest
" hi pythonRawString
" hi pythonNumber
hi pythonBuiltin guifg=#57a9ad
hi pythonAttribute guifg=#57a9ad
hi pythonExceptions guifg=#b37faf
" hi pythonSync
hi pythonClass guifg=#ed9200 gui=italic,bold
hi pythonFunctionCall guifg=#ab9a90
hi pythonImport guifg=#958fdb
hi pythonBoolean guifg=#42819e
hi pythonNone guifg=#42819e
hi pythonBuiltinObj guifg=#42819e 
hi pythonBuiltinFunc guifg=#42819e
hi pythonBuiltinType guifg=#42819e
" hi pythonRawFString
" hi pythonExClass
hi pythonClassVar guifg=#6e889c gui=italic
" hi pythonRaiseFromStatement
" hi pythonHexNumber
" hi pythonOctNumber
" hi pythonBinNumber
" hi pythonFloat
" hi pythonBytes
" hi pythonSingleton
" hi pythonError
" hi pythonDottedName
hi pythonDot guifg=#6e889c

hi PreProc guifg=#c15fe1
hi PMenu guibg=#56606B
hi PMenuSel guibg=#42819e
hi PmenuThumb guifg=#000000
hi SignColumn guibg=#1f2229
hi DiffText guibg=#00660a guifg=black
hi DiffAdd guibg=#34464f
hi DiffDelete guibg=#db2e4e guifg=#000000
hi SpellBad guibg=#ba9e9e
hi Floaterm guifg=#6a7a96
hi FloatermBorder guifg=#758ba9 guibg=#22262
hi EasyMotionShade guibg=#22262
hi EasyMotionTarget guibg=#22262 guifg=#Be8500 gui=bold

" HTML
hi htmlTagName guifg=#9ba2af
hi htmlTag guifg=#6a7a96
hi htmlEndTag guifg=#6a7a96
hi htmlArg guifg=#6a7a96
hi htmlTitle guifg=#1da870
hi htmlString guifg=#7ccab8

" CSS 
" Matchup plugin
hi MatchWord guibg=#22262 guifg=#7c7eca gui=underline
hi MatchWordCur guibg=#22262 guifg=#7c7eca gui=underline
hi MatchParen guibg=#22262 guifg=#7c7eca gui=underline
hi MatchParenCur guibg=#22262 guifg=#7c7eca gui=underline

" VIM Tabs
hi TabLineFill guibg=#22262 guifg=white
hi TabLine guibg=#22262 guifg=#50585c
hi TabLineSel guibg=#22262 guifg=#8bb5c9 gui=bold



" " References to the same variable
" highlight LspReference guifg=NONE guibg=#1a1d23 guisp=NONE gui=NONE cterm=NONE ctermfg=NONE ctermbg=59
" highlight! link LspReferenceText LspReference
" highlight! link LspReferenceRead LspReference
" highlight! link LspReferenceWrite LspReference

