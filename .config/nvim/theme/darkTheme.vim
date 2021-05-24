"------------- Theme ----------
set termguicolors
colorscheme dogrun
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

"colorscheme xcodedarkhc

let g:airline_theme = "hybrid"

"Highlight search color 
hi Search guibg=#c7ac00
hi Normal guibg=#1c2022
hi LineNr guifg=#383838
hi CursorLineNr guifg=#808080
hi CursorLine guibg=#252b2e
hi Comment guifg=#626262
hi Comment gui=italic
hi Function guifg=#51cedf
hi PythonOperator guifg=#ddcb83
hi PythonStatement guifg=#c15fe1
hi PythonBuiltin guifg = #bd863d
hi Float guifg=#bd863d 
hi Boolean guifg=#bd863d
hi Conditional guifg=#c15fe1
hi String guifg=#89b866
hi Repeat guifg=#c15fe1
hi Exception guifg=#c15fe1
hi Constant guifg=#bd863d
hi Number guifg=#bd863d
hi Statement guifg=#bdbdbd
hi Label guifg=#bdbdbd
hi PreProc guifg=#c15fe1
hi ClsasStorage guifg=#bd863d
hi Structure guifg=#bd863d
hi Floaterm guifg=#bdbdbd
hi FloatermBorder guifg=#1f9638 guibg=#1c2022
hi EasyMotionShade guibg=#1c2022
hi EasyMotionTarget guifg=#69c924
hi PMenu guibg=#24292b
hi DiffText guibg=#00660a guifg=black
hi DiffAdd guibg=#34464f
hi DiffDelete guibg=#db2e4e guifg=#000000
hi SpellBad guibg=#ba9e9e

" HTML
hi htmlTagName guifg=#c76a4c
hi htmlTag guifg=#1e7570 
hi htmlEndTag guifg=#1e7570
hi htmlArg guifg=#bfa332
hi htmlTitle guifg=#1da870
hi htmlString guifg=#6bd1a5

" CSS 
" Matchup plugin
hi MatchWord guibg=#252b2e guifg=#0095ff gui=underline
hi MatchWordCur guibg=#252b2e guifg=#0095ff gui=underline
hi MatchParen guibg=#252b2e guifg=#0095ff gui=underline
hi MatchParenCur guibg=#252b2e guifg=#0095ff gui=underline

" VIM Tabs
hi TabLineFill guibg=#1c2022 guifg=white
hi TabLine guibg=#1c2022 guifg=#50585c
hi TabLineSel guibg=#3f484f guifg=#8bb5c9 gui=bold

" VIM Lualine
hi  Lualine_a_normal guibg=#1c2022 guifg=#444f54
hi  Lualine_b_normal guibg=#1c2022 guifg=#3d464a
hi  Lualine_c_normal guibg=#1c2022 guifg=#3d464a

hi  Lualine_a_insert guibg=#0d8f75 guifg=#003d31
hi  Lualine_b_insert guibg=#1c2022 guifg=#3d464a
hi  Lualine_c_insert guibg=#1c2022 guifg=#3d464a

hi lualine_a_inactive guibg=#283f4a guifg=#fff
hi lualine_b_inactive guibg=#283f4a guifg=#fff
hi lualine_c_inactive guibg=#283f4a guifg=#fff

hi lualine_a_command cterm=bold gui=bold guifg=#cfcfcf guibg=#96004e
hi lualine_b_command guifg=#ad5e87 guibg=#1c2022
hi lualine_c_command guifg=#d687b0 guibg=#1c2022

hi lualine_a_visual cterm=bold gui=bold guifg=#4d1f00 guibg=#d45500
hi lualine_b_visual guifg=#c7a569 guibg=#1c2022
hi lualine_c_visual guifg=#c7a569 guibg=#1c2022

hi lualine_a_normal_to_lualine_c_normal guifg=#29414d guibg=#1c2022
hi lualine_c_normal_to_lualine_b_normal guifg=#29414d guibg=#1c2022
hi lualine_b_normal_to_lualine_a_normal guifg=#29414d guibg=#1c2022
hi lualine_a_insert_to_lualine_c_insert guifg=#0d8f75 guibg=#1c2022
hi lualine_c_insert_to_lualine_b_insert guifg=#0d8f75  guibg=#1c2022
hi lualine_b_insert_to_lualine_a_insert guifg=#0d8f75  guibg=#1c2022
hi lualine_a_command_to_lualine_c_command guifg=#96004e guibg=#1c2022
hi lualine_c_command_to_lualine_b_command guifg=#96004e guibg=#1c2022
hi lualine_b_command_to_lualine_a_command guifg=#96004e guibg=#1c2022
hi lualine_a_visual_to_lualine_c_visual guifg=#d45500 guibg=#1c2022
hi lualine_c_visual_to_lualine_b_visual guifg= #d45500 guibg=#1c2022
hi lualine_b_visual_to_lualine_a_visual guifg=#d45500 guibg=#1c2022
