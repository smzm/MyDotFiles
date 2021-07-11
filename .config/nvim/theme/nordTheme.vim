"------------- Theme ----------
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"Highlight search color 
hi Search guibg=#c7ac00
hi Normal guibg=#22262e guifg=#C2D3E7
hi LineNr guifg=#2f333b
hi CursorLineNr guifg=#585d67
hi CursorLine guibg=#29303b
hi Comment gui=italic
" hi Comment guifg=#626262
" hi Function guifg=#8682CA
" hi PythonOperator guifg=#8682CA
" hi PythonStatement guifg=#7ccab8
" hi PythonBuiltin guifg = #7ccab8
" hi Float guifg=#bd863d 
" hi Boolean guifg=#bd863d
" hi Conditional guifg=#c15fe1
hi String guifg=#7ccab8
" hi Repeat guifg=#c15fe1
" hi Exception guifg=#c15fe1
hi Constant guifg=#bd863d
" hi Number guifg=#bd863d
" hi Statement guifg=#bdbdbd
" hi Label guifg=#bdbdbd
" hi PreProc guifg=#c15fe1
" hi ClsasStorage guifg=#bd863d
" hi Structure guifg=#bd863d
" hi PMenu guibg=#24292b
hi PmenuThumb guifg=#000000
" hi DiffText guibg=#00660a guifg=black
" hi DiffAdd guibg=#34464f
" hi DiffDelete guibg=#db2e4e guifg=#000000
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

