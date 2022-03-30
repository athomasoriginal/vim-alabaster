" -----------------------------------------------------------------------------
" File: alabaster.vim
" Description: Tonsky's alabaster
" Author: Thomas <thomasmattacchione@gmail.com>
" Source: ...
" Last Modified: Mar 30, 2022
"
" This is borrowed and modified from the amazing work of
" https://github.com/morhetz/gruvbox/blob/master/colors/gruvbox.vim and
" -----------------------------------------------------------------------------

" Supporting code -------------------------------------------------------------
" Initialisation: {{{


if version > 580
  hi clear
  if exists("syntax_on")
    syntax reset
  endif
endif

let g:colors_name='alabaster'

if !(has('termguicolors') && &termguicolors) && !has('gui_running') && &t_Co != 256
  finish
endif

" }}}
" Global Settings: {{{

if !exists('g:alabaster_bold')
  let g:alabaster_bold=1
endif

if !exists('g:alabaster_italic')
  if has('gui_running') || $TERM_ITALICS == 'true'
    let g:alabaster_italic=1
  else
    let g:alabaster_italic=0
  endif
endif

if !exists('g:alabaster_undercurl')
  let g:alabaster_undercurl=1
endif

if !exists('g:alabaster_underline')
  let g:alabaster_underline=1
endif

if !exists('g:alabaster_inverse')
  let g:alabaster_inverse=1
endif

if !exists('g:alabaster_guisp_fallback') || index(['fg', 'bg'], g:alabaster_guisp_fallback) == -1
  let g:alabaster_guisp_fallback='NONE'
endif

if !exists('g:alabaster_improved_strings')
  let g:alabaster_improved_strings=0
endif

if !exists('g:alabaster_improved_warnings')
  let g:alabaster_improved_warnings=0
endif

if !exists('g:alabaster_termcolors')
  let g:alabaster_termcolors=256
endif

if !exists('g:alabaster_invert_indent_guides')
  let g:alabaster_invert_indent_guides=0
endif

if exists('g:alabaster_contrast')
  echo 'g:alabaster_contrast is deprecated; use g:alabaster_contrast_light and g:alabaster_contrast_dark instead'
endif

if !exists('g:alabaster_contrast_dark')
  let g:alabaster_contrast_dark='medium'
endif

if !exists('g:alabaster_contrast_light')
  let g:alabaster_contrast_light='medium'
endif

let s:is_dark=(&background == 'dark')

" }}}
" Palette: {{{

" setup palette dictionary
let s:gb = {}

" fill it with absolute colors
let s:gb.dark0_hard  = ['#1d2021', 234]     " 29-32-33
let s:gb.dark0       = ['#282828', 235]     " 40-40-40
let s:gb.dark0_soft  = ['#32302f', 236]     " 50-48-47
let s:gb.dark1       = ['#3c3836', 237]     " 60-56-54
let s:gb.dark2       = ['#504945', 239]     " 80-73-69
let s:gb.dark3       = ['#665c54', 241]     " 102-92-84
let s:gb.dark4       = ['#7c6f64', 243]     " 124-111-100
let s:gb.dark4_256   = ['#7c6f64', 243]     " 124-111-100

let s:gb.gray_245    = ['#928374', 245]     " 146-131-116
let s:gb.gray_244    = ['#928374', 244]     " 146-131-116

let s:gb.light0_hard = ['#f9f5d7', 230]     " 249-245-215
let s:gb.light0      = ['#fbf1c7', 229]     " 253-244-193
let s:gb.light0_soft = ['#f2e5bc', 228]     " 242-229-188
let s:gb.light1      = ['#ebdbb2', 223]     " 235-219-178
let s:gb.light2      = ['#d5c4a1', 250]     " 213-196-161
let s:gb.light3      = ['#bdae93', 248]     " 189-174-147
let s:gb.light4      = ['#a89984', 246]     " 168-153-132
let s:gb.light4_256  = ['#a89984', 246]     " 168-153-132

let s:gb.bright_red     = ['#fb4934', 167]     " 251-73-52
let s:gb.bright_green   = ['#b8bb26', 142]     " 184-187-38
let s:gb.bright_yellow  = ['#fabd2f', 214]     " 250-189-47
let s:gb.bright_blue    = ['#83a598', 109]     " 131-165-152
let s:gb.bright_purple  = ['#d3869b', 175]     " 211-134-155
let s:gb.bright_aqua    = ['#8ec07c', 108]     " 142-192-124
let s:gb.bright_orange  = ['#fe8019', 208]     " 254-128-25

let s:gb.neutral_red    = ['#cc241d', 124]     " 204-36-29
let s:gb.neutral_green  = ['#98971a', 106]     " 152-151-26
let s:gb.neutral_yellow = ['#d79921', 172]     " 215-153-33
let s:gb.neutral_blue   = ['#458588', 66]      " 69-133-136
let s:gb.neutral_purple = ['#b16286', 132]     " 177-98-134
let s:gb.neutral_aqua   = ['#689d6a', 72]      " 104-157-106
let s:gb.neutral_orange = ['#d65d0e', 166]     " 214-93-14

let s:gb.faded_red      = ['#9d0006', 88]      " 157-0-6
let s:gb.faded_green    = ['#79740e', 100]     " 121-116-14
let s:gb.faded_yellow   = ['#b57614', 136]     " 181-118-20
let s:gb.faded_blue     = ['#076678', 24]      " 7-102-120
let s:gb.faded_purple   = ['#8f3f71', 96]      " 143-63-113
let s:gb.faded_aqua     = ['#427b58', 66]      " 66-123-88
let s:gb.faded_orange   = ['#af3a03', 130]     " 175-58-3

" }}}
" Setup Emphasis: {{{

let s:bold = 'bold,'
if g:alabaster_bold == 0
  let s:bold = ''
endif

let s:italic = 'italic,'
if g:alabaster_italic == 0
  let s:italic = ''
endif

let s:underline = 'underline,'
if g:alabaster_underline == 0
  let s:underline = ''
endif

let s:undercurl = 'undercurl,'
if g:alabaster_undercurl == 0
  let s:undercurl = ''
endif

let s:inverse = 'inverse,'
if g:alabaster_inverse == 0
  let s:inverse = ''
endif

" }}}
" Setup Colors: {{{

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

" determine relative colors
if s:is_dark
  let s:bg0  = s:gb.dark0
  if g:alabaster_contrast_dark == 'soft'
    let s:bg0  = s:gb.dark0_soft
  elseif g:alabaster_contrast_dark == 'hard'
    let s:bg0  = s:gb.dark0_hard
  endif

  let s:bg1  = s:gb.dark1
  let s:bg2  = s:gb.dark2
  let s:bg3  = s:gb.dark3
  let s:bg4  = s:gb.dark4

  let s:gray = s:gb.gray_245

  let s:fg0 = s:gb.light0
  let s:fg1 = s:gb.light1
  let s:fg2 = s:gb.light2
  let s:fg3 = s:gb.light3
  let s:fg4 = s:gb.light4

  let s:fg4_256 = s:gb.light4_256

  let s:red    = s:gb.bright_red
  let s:green  = s:gb.bright_green
  let s:yellow = s:gb.bright_yellow
  let s:blue   = s:gb.bright_blue
  let s:purple = s:gb.bright_purple
  let s:aqua   = s:gb.bright_aqua
  let s:orange = s:gb.bright_orange
else
  let s:bg0  = s:gb.light0
  if g:alabaster_contrast_light == 'soft'
    let s:bg0  = s:gb.light0_soft
  elseif g:alabaster_contrast_light == 'hard'
    let s:bg0  = s:gb.light0_hard
  endif

  let s:bg1  = s:gb.light1
  let s:bg2  = s:gb.light2
  let s:bg3  = s:gb.light3
  let s:bg4  = s:gb.light4

  let s:gray = s:gb.gray_244

  let s:fg0 = s:gb.dark0
  let s:fg1 = s:gb.dark1
  let s:fg2 = s:gb.dark2
  let s:fg3 = s:gb.dark3
  let s:fg4 = s:gb.dark4

  let s:fg4_256 = s:gb.dark4_256

  let s:red    = s:gb.faded_red
  let s:green  = s:gb.faded_green
  let s:yellow = s:gb.faded_yellow
  let s:blue   = s:gb.faded_blue
  let s:purple = s:gb.faded_purple
  let s:aqua   = s:gb.faded_aqua
  let s:orange = s:gb.faded_orange
endif

" reset to 16 colors fallback
if g:alabaster_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:gb.bg0 = s:bg0
let s:gb.bg1 = s:bg1
let s:gb.bg2 = s:bg2
let s:gb.bg3 = s:bg3
let s:gb.bg4 = s:bg4

let s:gb.gray = s:gray

let s:gb.fg0 = s:fg0
let s:gb.fg1 = s:fg1
let s:gb.fg2 = s:fg2
let s:gb.fg3 = s:fg3
let s:gb.fg4 = s:fg4

let s:gb.fg4_256 = s:fg4_256

let s:gb.red    = s:red
let s:gb.green  = s:green
let s:gb.yellow = s:yellow
let s:gb.blue   = s:blue
let s:gb.purple = s:purple
let s:gb.aqua   = s:aqua
let s:gb.orange = s:orange

" }}}
" Setup Terminal Colors For Neovim: {{{

if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:gb.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:gb.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:gb.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:gb.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:gb.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:gb.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif

" }}}
" Overload Setting: {{{

let s:hls_cursor = s:orange
if exists('g:alabaster_hls_cursor')
  let s:hls_cursor = get(s:gb, g:alabaster_hls_cursor)
endif

let s:number_column = s:none
if exists('g:alabaster_number_column')
  let s:number_column = get(s:gb, g:alabaster_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:alabaster_sign_column')
    let s:sign_column = get(s:gb, g:alabaster_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:alabaster_color_column')
  let s:color_column = get(s:gb, g:alabaster_color_column)
endif

let s:vert_split = s:bg0
if exists('g:alabaster_vert_split')
  let s:vert_split = get(s:gb, g:alabaster_vert_split)
endif

let s:invert_signs = ''
if exists('g:alabaster_invert_signs')
  if g:alabaster_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:alabaster_invert_selection')
  if g:alabaster_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:alabaster_invert_tabline')
  if g:alabaster_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:alabaster_italicize_comments')
  if g:alabaster_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:alabaster_italicize_strings')
  if g:alabaster_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

" }}}
" Alabaster Hi Groups: {{{

" memoize common hi groups
call s:HL('AlabasterFg0', s:fg0)
call s:HL('AlabasterFg1', s:fg1)
call s:HL('AlabasterFg2', s:fg2)
call s:HL('AlabasterFg3', s:fg3)
call s:HL('AlabasterFg4', s:fg4)
call s:HL('AlabasterGray', s:gray)
call s:HL('AlabasterBg0', s:bg0)
call s:HL('AlabasterBg1', s:bg1)
call s:HL('AlabasterBg2', s:bg2)
call s:HL('AlabasterBg3', s:bg3)
call s:HL('AlabasterBg4', s:bg4)

call s:HL('AlabasterRed', s:red)
call s:HL('AlabasterRedBold', s:red, s:none, s:bold)
call s:HL('AlabasterGreen', s:green)
call s:HL('AlabasterGreenBold', s:green, s:none, s:bold)
call s:HL('AlabasterYellow', s:yellow)
call s:HL('AlabasterYellowBold', s:yellow, s:none, s:bold)
call s:HL('AlabasterBlue', s:blue)
call s:HL('AlabasterBlueBold', s:blue, s:none, s:bold)
call s:HL('AlabasterPurple', s:purple)
call s:HL('AlabasterPurpleBold', s:purple, s:none, s:bold)
call s:HL('AlabasterAqua', s:aqua)
call s:HL('AlabasterAquaBold', s:aqua, s:none, s:bold)
call s:HL('AlabasterOrange', s:orange)
call s:HL('AlabasterOrangeBold', s:orange, s:none, s:bold)

call s:HL('AlabasterRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('AlabasterGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('AlabasterYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('AlabasterBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('AlabasterPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('AlabasterAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('AlabasterOrangeSign', s:orange, s:sign_column, s:invert_signs)

" }}}
" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{

call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText AlabasterBg2
hi! link SpecialKey AlabasterBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory AlabasterGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title AlabasterGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)

" More prompt: -- More --
hi! link MoreMsg AlabasterYellowBold

" Current mode message: -- INSERT --
hi! link ModeMsg AlabasterYellowBold

" 'Press enter' prompt and yes/no questions
hi! link Question AlabasterOrangeBold

" Warning messages
hi! link WarningMsg AlabasterRedBold

" }}}
" Gutter: {{{

" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)

" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)

" Visual mode cursor, selection
hi! link vCursor Cursor

" Input moder cursor
hi! link iCursor Cursor

" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:alabaster_improved_strings == 0
  hi! link Special AlabasterOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement AlabasterRed
" if, then, else, endif, swicth, etc.
hi! link Conditional AlabasterRed
" for, do, while, etc.
hi! link Repeat AlabasterRed
" case, default, etc.
hi! link Label AlabasterRed
" try, catch, throw
hi! link Exception AlabasterRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword AlabasterRed

" Variable name
hi! link Identifier AlabasterBlue
" Function name
hi! link Function AlabasterGreenBold

" Generic preprocessor
hi! link PreProc AlabasterAqua
" Preprocessor #include
hi! link Include AlabasterAqua
" Preprocessor #define
hi! link Define AlabasterAqua
" Same as Define
hi! link Macro AlabasterAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit AlabasterAqua

" Generic constant
hi! link Constant AlabasterPurple
" Character constant: 'c', '/n'
hi! link Character AlabasterPurple
" String constant: "this is a string"
if g:alabaster_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean AlabasterPurple
" Number constant: 234, 0xff
hi! link Number AlabasterPurple
" Floating point constant: 2.3e10
hi! link Float AlabasterPurple

" Generic type
hi! link Type AlabasterYellow
" static, register, volatile, etc
hi! link StorageClass AlabasterOrange
" struct, union, enum, etc.
hi! link Structure AlabasterAqua
" typedef
hi! link Typedef AlabasterYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:alabaster_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}
" Plugin specific -------------------------------------------------------------
" EasyMotion: {{{

hi! link EasyMotionTarget Search
hi! link EasyMotionShade Comment

" }}}
" Sneak: {{{

hi! link Sneak Search
hi! link SneakLabel Search

" }}}
" Indent Guides: {{{

if !exists('g:indent_guides_auto_colors')
  let g:indent_guides_auto_colors = 0
endif

if g:indent_guides_auto_colors == 0
  if g:alabster_invert_indent_guides == 0
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg1)
  else
    call s:HL('IndentGuidesOdd', s:vim_bg, s:bg2, s:inverse)
    call s:HL('IndentGuidesEven', s:vim_bg, s:bg3, s:inverse)
  endif
endif

" }}}
" IndentLine: {{{

if !exists('g:indentLine_color_term')
  let g:indentLine_color_term = s:bg2[1]
endif
if !exists('g:indentLine_color_gui')
  let g:indentLine_color_gui = s:bg2[0]
endif

" }}}
" Rainbow Parentheses: {{{

if !exists('g:rbpt_colorpairs')
  let g:rbpt_colorpairs =
    \ [
      \ ['blue', '#458588'], ['magenta', '#b16286'],
      \ ['red',  '#cc241d'], ['166',     '#d65d0e']
    \ ]
endif

let g:rainbow_guifgs = [ '#d65d0e', '#cc241d', '#b16286', '#458588' ]
let g:rainbow_ctermfgs = [ '166', 'red', 'magenta', 'blue' ]

if !exists('g:rainbow_conf')
   let g:rainbow_conf = {}
endif
if !has_key(g:rainbow_conf, 'guifgs')
   let g:rainbow_conf['guifgs'] = g:rainbow_guifgs
endif
if !has_key(g:rainbow_conf, 'ctermfgs')
   let g:rainbow_conf['ctermfgs'] = g:rainbow_ctermfgs
endif

let g:niji_dark_colours = g:rbpt_colorpairs
let g:niji_light_colours = g:rbpt_colorpairs

"}}}
" GitGutter: {{{

hi! link GitGutterAdd AlabasterGreenSign
hi! link GitGutterChange AlabasterAquaSign
hi! link GitGutterDelete AlabasterRedSign
hi! link GitGutterChangeDelete AlabasterAquaSign

" }}}
" GitCommit: "{{{

hi! link gitcommitSelectedFile AlabasterGreen
hi! link gitcommitDiscardedFile AlabasterRed

" }}}
" Signify: {{{

hi! link SignifySignAdd AlabasterGreenSign
hi! link SignifySignChange AlabasterAquaSign
hi! link SignifySignDelete AlabasterRedSign

" }}}
" Syntastic: {{{

call s:HL('SyntasticError', s:none, s:none, s:undercurl, s:red)
call s:HL('SyntasticWarning', s:none, s:none, s:undercurl, s:yellow)

hi! link SyntasticErrorSign AlabasterRedSign
hi! link SyntasticWarningSign AlabasterYellowSign

" }}}
" Signature: {{{
hi! link SignatureMarkText   AlabasterBlueSign
hi! link SignatureMarkerText AlabasterPurpleSign

" }}}
" ShowMarks: {{{

hi! link ShowMarksHLl AlabasterBlueSign
hi! link ShowMarksHLu AlabasterBlueSign
hi! link ShowMarksHLo AlabasterBlueSign
hi! link ShowMarksHLm AlabasterBlueSign

" }}}
" CtrlP: {{{

hi! link CtrlPMatch AlabasterYellow
hi! link CtrlPNoEntries AlabasterRed
hi! link CtrlPPrtBase AlabasterBg2
hi! link CtrlPPrtCursor AlabasterBlue
hi! link CtrlPLinePre AlabasterBg2

call s:HL('CtrlPMode1', s:blue, s:bg2, s:bold)
call s:HL('CtrlPMode2', s:bg0, s:blue, s:bold)
call s:HL('CtrlPStats', s:fg4, s:bg2, s:bold)

" }}}
" Startify: {{{

hi! link StartifyBracket AlabasterFg3
hi! link StartifyFile AlabasterFg1
hi! link StartifyNumber AlabasterBlue
hi! link StartifyPath AlabasterGray
hi! link StartifySlash AlabasterGray
hi! link StartifySection AlabasterYellow
hi! link StartifySpecial AlabasterBg2
hi! link StartifyHeader AlabasterOrange
hi! link StartifyFooter AlabasterBg2

" }}}
" Vimshell: {{{

let g:vimshell_escape_colors = [
  \ s:bg4[0], s:red[0], s:green[0], s:yellow[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg4[0],
  \ s:bg0[0], s:red[0], s:green[0], s:orange[0],
  \ s:blue[0], s:purple[0], s:aqua[0], s:fg0[0]
  \ ]

" }}}
" BufTabLine: {{{

call s:HL('BufTabLineCurrent', s:bg0, s:fg4)
call s:HL('BufTabLineActive', s:fg4, s:bg2)
call s:HL('BufTabLineHidden', s:bg4, s:bg1)
call s:HL('BufTabLineFill', s:bg0, s:bg0)

" }}}
" Asynchronous Lint Engine: {{{

call s:HL('ALEError', s:none, s:none, s:undercurl, s:red)
call s:HL('ALEWarning', s:none, s:none, s:undercurl, s:yellow)
call s:HL('ALEInfo', s:none, s:none, s:undercurl, s:blue)

hi! link ALEErrorSign AlabasterRedSign
hi! link ALEWarningSign AlabasterYellowSign
hi! link ALEInfoSign AlabasterBlueSign

" }}}
" Dirvish: {{{

hi! link DirvishPathTail AlabasterAqua
hi! link DirvishArg AlabasterYellow

" }}}
" Netrw: {{{

hi! link netrwDir AlabasterAqua
hi! link netrwClassify AlabasterAqua
hi! link netrwLink AlabasterGray
hi! link netrwSymLink AlabasterFg1
hi! link netrwExe AlabasterYellow
hi! link netrwComment AlabasterGray
hi! link netrwList AlabasterBlue
hi! link netrwHelpCmd AlabasterAqua
hi! link netrwCmdSep AlabasterFg3
hi! link netrwVersion AlabasterGreen

" }}}
" NERDTree: {{{

hi! link NERDTreeDir AlabasterAqua
hi! link NERDTreeDirSlash AlabasterAqua

hi! link NERDTreeOpenable AlabasterOrange
hi! link NERDTreeClosable AlabasterOrange

hi! link NERDTreeFile AlabasterFg1
hi! link NERDTreeExecFile AlabasterYellow

hi! link NERDTreeUp AlabasterGray
hi! link NERDTreeCWD AlabasterGreen
hi! link NERDTreeHelp AlabasterFg1

hi! link NERDTreeToggleOn AlabasterGreen
hi! link NERDTreeToggleOff AlabasterRed

" }}}
" Vim Multiple Cursors: {{{

call s:HL('multiple_cursors_cursor', s:none, s:none, s:inverse)
call s:HL('multiple_cursors_visual', s:none, s:bg2)

" }}}
" coc.nvim: {{{

hi! link CocErrorSign AlabasterRedSign
hi! link CocWarningSign AlabasterOrangeSign
hi! link CocInfoSign AlabasterYellowSign
hi! link CocHintSign AlabasterBlueSign
hi! link CocErrorFloat AlabasterRed
hi! link CocWarningFloat AlabasterOrange
hi! link CocInfoFloat AlabasterYellow
hi! link CocHintFloat AlabasterBlue
hi! link CocDiagnosticsError AlabasterRed
hi! link CocDiagnosticsWarning AlabasterOrange
hi! link CocDiagnosticsInfo AlabasterYellow
hi! link CocDiagnosticsHint AlabasterBlue

hi! link CocSelectedText AlabasterRed
hi! link CocCodeLens AlabasterGray

call s:HL('CocErrorHighlight', s:none, s:none, s:undercurl, s:red)
call s:HL('CocWarningHighlight', s:none, s:none, s:undercurl, s:orange)
call s:HL('CocInfoHighlight', s:none, s:none, s:undercurl, s:yellow)
call s:HL('CocHintHighlight', s:none, s:none, s:undercurl, s:blue)

" }}}
" Filetype specific -----------------------------------------------------------
" Diff: {{{

hi! link diffAdded AlabasterGreen
hi! link diffRemoved AlabasterRed
hi! link diffChanged AlabasterAqua

hi! link diffFile AlabasterOrange
hi! link diffNewFile AlabasterYellow

hi! link diffLine AlabasterBlue

" }}}
" Html: {{{

hi! link htmlTag AlabasterBlue
hi! link htmlEndTag AlabasterBlue

hi! link htmlTagName AlabasterAquaBold
hi! link htmlArg AlabasterAqua

hi! link htmlScriptTag AlabasterPurple
hi! link htmlTagN AlabasterFg1
hi! link htmlSpecialTagName AlabasterAquaBold

call s:HL('htmlLink', s:fg4, s:none, s:underline)

hi! link htmlSpecialChar AlabasterOrange

call s:HL('htmlBold', s:vim_fg, s:vim_bg, s:bold)
call s:HL('htmlBoldUnderline', s:vim_fg, s:vim_bg, s:bold . s:underline)
call s:HL('htmlBoldItalic', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('htmlBoldUnderlineItalic', s:vim_fg, s:vim_bg, s:bold . s:underline . s:italic)

call s:HL('htmlUnderline', s:vim_fg, s:vim_bg, s:underline)
call s:HL('htmlUnderlineItalic', s:vim_fg, s:vim_bg, s:underline . s:italic)
call s:HL('htmlItalic', s:vim_fg, s:vim_bg, s:italic)

" }}}
" Xml: {{{

hi! link xmlTag AlabasterBlue
hi! link xmlEndTag AlabasterBlue
hi! link xmlTagName AlabasterBlue
hi! link xmlEqual AlabasterBlue
hi! link docbkKeyword AlabasterAquaBold

hi! link xmlDocTypeDecl AlabasterGray
hi! link xmlDocTypeKeyword AlabasterPurple
hi! link xmlCdataStart AlabasterGray
hi! link xmlCdataCdata AlabasterPurple
hi! link dtdFunction AlabasterGray
hi! link dtdTagName AlabasterPurple

hi! link xmlAttrib AlabasterAqua
hi! link xmlProcessingDelim AlabasterGray
hi! link dtdParamEntityPunct AlabasterGray
hi! link dtdParamEntityDPunct AlabasterGray
hi! link xmlAttribPunct AlabasterGray

hi! link xmlEntity AlabasterOrange
hi! link xmlEntityPunct AlabasterOrange
" }}}
" Vim: {{{

call s:HL('vimCommentTitle', s:fg4_256, s:none, s:bold . s:italicize_comments)

hi! link vimNotation AlabasterOrange
hi! link vimBracket AlabasterOrange
hi! link vimMapModKey AlabasterOrange
hi! link vimFuncSID AlabasterFg3
hi! link vimSetSep AlabasterFg3
hi! link vimSep AlabasterFg3
hi! link vimContinue AlabasterFg3

" }}}
" Clojure: {{{

hi! link clojureKeyword AlabasterBlue
hi! link clojureCond AlabasterOrange
hi! link clojureSpecial AlabasterOrange
hi! link clojureDefine AlabasterOrange

hi! link clojureFunc AlabasterYellow
hi! link clojureRepeat AlabasterYellow
hi! link clojureCharacter AlabasterAqua
hi! link clojureStringEscape AlabasterAqua
hi! link clojureException AlabasterRed

hi! link clojureRegexp AlabasterAqua
hi! link clojureRegexpEscape AlabasterAqua
call s:HL('clojureRegexpCharClass', s:fg3, s:none, s:bold)
hi! link clojureRegexpMod clojureRegexpCharClass
hi! link clojureRegexpQuantifier clojureRegexpCharClass

hi! link clojureParen AlabasterFg3
hi! link clojureAnonArg AlabasterYellow
hi! link clojureVariable AlabasterBlue
hi! link clojureMacro AlabasterOrange

hi! link clojureMeta AlabasterYellow
hi! link clojureDeref AlabasterYellow
hi! link clojureQuote AlabasterYellow
hi! link clojureUnquote AlabasterYellow
