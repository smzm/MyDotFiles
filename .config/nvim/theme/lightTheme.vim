"------------------------- Light Theme
set background=light

let g:PaperColor_Theme_Options = {
  \   'theme': {
  \     'default.light': {
  \       'override' : {
  \         'color00' : ['#e3e3e3', '232'],
  \         'linenumber_bg' : ['#e3e3e3', '232'],
  \          'allow_bold' : 1,
  \          'allow_italic' : 1,
  \          'color03' : ['#0055ff', '232'],
  \          'color07' : ['#636363', '232'],
  \          'color09' : ['#5b00db', '232'],
  \          'color15' : ['#5b00db', '232'],
  \       }
  \     }
  \   }
  \ }

"------------- Theme ----------
let g:airline_theme = "atomic"
set termguicolors     " enable true colors support


" IndentLine {{
let g:indentLine_char = ''
let g:indentLine_first_char = ''
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_setColors = 0
" }}

colorscheme PaperColor

"Highlight search color 
" General
hi Error guibg=#bfbfbf
hi Search guibg=#fcba03
hi Normal guibg=#e3e3e3
hi LineNr guifg=#b3b3b3
hi CursorLineNr guifg=#787878
hi CursorLineNr guibg=#e3e3e3
hi CursorLine guibg=#dedede
hi Comment guifg=#a1a1a1
hi Comment gui=italic
hi Function guifg=#e85900 gui=bold
hi Cursor guibg=black 
hi Visual guibg=black 
hi PythonOperator guifg=#1d1485 gui=italic,bold
hi PythonStatement guifg=#023ae0 gui=italic,bold
hi PythonBuiltin guifg=#bd863d
hi Float guifg=#059c43
hi Boolean guifg=#bd863d
hi Conditional guifg=#c15fe1
hi String guifg=#059c43 
hi Repeat guifg=#c15fe1
hi Exception guifg=#c15fe1
hi Constant guifg=#f25d00
hi Number guifg=#059c43
hi Statement guifg=#db2e4e gui=bold
hi Label guifg=#bdbdbd
hi PreProc guifg=#c15fe1
hi ClsasStorage guifg=#9c0091 
hi Structure guifg=#4b00b5
hi Floaterm guifg=#bdbdbd
hi FloatermBorder guifg=#1d1485 guibg=#e3e3e3
hi EasyMotionShade guibg=#e3e3e3
hi EasyMotionTarget guifg=white guibg=#d92b00
hi PMenu guibg=#dedede
hi DiffText guibg=#00660a guifg=black
hi DiffAdd guibg=#34464f
hi DiffDelete guibg=#db2e4e guifg=#000000
hi SpellBad guibg=#ba9e9e
" HTML
hi htmlTagName guifg=#f25d00
hi htmlTag guifg=#1e7570 
hi htmlEndTag guifg=#1e7570
hi htmlArg guifg=#e86500
hi htmlTitle guifg=#e86500 

" CSS 
" Matchup plugin
hi MatchWord guibg=#e3e3e3 guifg=blue gui=underline
hi MatchWordCur guibg=#e3e3e3 guifg=blue gui=underline
hi MatchParen guibg=#e3e3e3 guifg=blue gui=underline
hi MatchParenCur guibg=#e3e3e3 guifg=blue gui=underline

" VIM Tabs
hi TabLineFill guibg=#cfcfcf guifg=white
hi TabLine guibg=#cfcfcf guifg=white
hi TabLineSel guibg=#b3b3b3 guifg=white gui=bold
