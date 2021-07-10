"------------- Theme ----------
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"


"Highlight search color 
hi Search guibg=#c7ac00
hi Normal guibg=#2e3541 guifg=#C2D3E7
hi LineNr guifg=#434954
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
hi FloatermBorder guifg=#758ba9 guibg=#2e3541
hi EasyMotionShade guibg=#2e3541
hi EasyMotionTarget guibg=#2e3541 guifg=#Be8500 gui=bold

" HTML
hi htmlTagName guifg=#9ba2af
hi htmlTag guifg=#6a7a96
hi htmlEndTag guifg=#6a7a96
hi htmlArg guifg=#6a7a96
hi htmlTitle guifg=#1da870
hi htmlString guifg=#7ccab8

" CSS 
" Matchup plugin
hi MatchWord guibg=#2e3541 guifg=#7c7eca gui=underline
hi MatchWordCur guibg=#29303b guifg=#7c7eca gui=underline
hi MatchParen guibg=#2e3541 guifg=#7c7eca gui=underline
hi MatchParenCur guibg=#29303b guifg=#7c7eca gui=underline

" VIM Tabs
hi TabLineFill guibg=#2e3541 guifg=white
hi TabLine guibg=#2e3541 guifg=#50585c
hi TabLineSel guibg=#29303b guifg=#8bb5c9 gui=bold

" " VIM Lualine
" hi  Lualine_a_normal guibg=#1c2022 guifg=#444f54
" hi  Lualine_b_normal guibg=#1c2022 guifg=#3d464a
" hi  Lualine_c_normal guibg=#1c2022 guifg=#3d464a

" hi  Lualine_a_insert guibg=#0d8f75 guifg=#003d31
" hi  Lualine_b_insert guibg=#1c2022 guifg=#3d464a
" hi  Lualine_c_insert guibg=#1c2022 guifg=#3d464a

" hi lualine_a_inactive guibg=#283f4a guifg=#fff
" hi lualine_b_inactive guibg=#283f4a guifg=#fff
" hi lualine_c_inactive guibg=#283f4a guifg=#fff

" hi lualine_a_command cterm=bold gui=bold guifg=#cfcfcf guibg=#96004e
" hi lualine_b_command guifg=#ad5e87 guibg=#1c2022
" hi lualine_c_command guifg=#d687b0 guibg=#1c2022

" hi lualine_a_visual cterm=bold gui=bold guifg=#4d1f00 guibg=#d45500
" hi lualine_b_visual guifg=#c7a569 guibg=#1c2022
" hi lualine_c_visual guifg=#c7a569 guibg=#1c2022

" hi lualine_a_normal_to_lualine_c_normal guifg=#29414d guibg=#1c2022
" hi lualine_c_normal_to_lualine_b_normal guifg=#29414d guibg=#1c2022
" hi lualine_b_normal_to_lualine_a_normal guifg=#29414d guibg=#1c2022
" hi lualine_a_insert_to_lualine_c_insert guifg=#0d8f75 guibg=#1c2022
" hi lualine_c_insert_to_lualine_b_insert guifg=#0d8f75  guibg=#1c2022
" hi lualine_b_insert_to_lualine_a_insert guifg=#0d8f75  guibg=#1c2022
" hi lualine_a_command_to_lualine_c_command guifg=#96004e guibg=#1c2022
" hi lualine_c_command_to_lualine_b_command guifg=#96004e guibg=#1c2022
" hi lualine_b_command_to_lualine_a_command guifg=#96004e guibg=#1c2022
" hi lualine_a_visual_to_lualine_c_visual guifg=#d45500 guibg=#1c2022
" hi lualine_c_visual_to_lualine_b_visual guifg= #d45500 guibg=#1c2022
" hi lualine_b_visual_to_lualine_a_visual guifg=#d45500 guibg=#1c2022
