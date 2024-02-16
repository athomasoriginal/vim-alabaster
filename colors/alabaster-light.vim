" Vim syntax file
" Languages: Markdown, Clojure, JavaScript, CSS, Bash
" Maintainer: Thomas Mattacchione
" Last Changed: Feb 16, 2024
set background=light

hi clear

if exists ('syntax_on')
  syntax reset
endif

let g:colors_name='alabaster-light'

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg='NONE'
  elseif a:mode == 'r'
    hi statusline guibg='NONE'
  else
    hi statusline guibg='NONE'
  endif
endfunction

au InsertEnter  * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave  * hi statusline guibg='NONE'

hi @markup.heading.5.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#000000 ctermfg=NONE guibg=#f7f7f7 ctermbg=NONE gui=NONE cterm=NONE
hi @markup.strong guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi @markup.heading.6 guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.raw.markdown_inline guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Terminal guifg=#000000 ctermfg=NONE guibg=#f7f7f7 ctermbg=NONE gui=NONE cterm=NONE
hi @function.builtin guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NonText guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=#f7f7f7 ctermfg=NONE guibg=#f0f0f0 ctermbg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#f0f0f0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @function guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.6.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Comment guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.1.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @tag.attribute.css guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=NONE gui=NONE cterm=NONE
hi @lsp.mod.definition guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.raw.block guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword.function guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @string.escape.javascript guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.2.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiagnosticUnnecessary guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.special.bash guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @conditional guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @label guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @include guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.special guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @repeat guifg= ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#000000 ctermfg=NONE guibg=#feff00 ctermbg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#f7f7f7 ctermfg=NONE guibg=#f0f0f0 ctermbg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#000000 ctermfg=NONE guibg=#feff00 ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi Question guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @constant.css guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#000000 ctermfg=NONE guibg=#AA3731 ctermbg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=NONE gui=NONE cterm=NONE
hi @function.css guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @type.javascript guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @constant.builtin guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#FFBC5D ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi Directory guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @string.escape guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.4 guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#FFBC5D ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi Folded guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @tag.css guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.strikethrough.markdown_inline guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.4.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#f0f0f0 ctermbg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @namespace guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.1 guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @label.bash guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.uri guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @markup.list guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#448C27 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.bracket guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @function.call guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.3.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @variable guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PmenuSel guifg=NONE ctermfg=NONE guibg=#BFDBFE ctermbg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @string.special.symbol guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi title guifg=#448C27 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#feff00 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @markup.heading.2 guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword.operator.javascript guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.italic.markdown_inline guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.list.unchecked guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Todo guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Normal guifg=#000000 ctermfg=NONE guibg=#f7f7f7 ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.delimiter guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @lsp.type.namespace guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=bold cterm=NONE
hi Cursor guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=NONE
hi @constructor.javascript guifg= ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.raw.delimiter guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#000000 ctermfg=NONE guibg=#feff00 ctermbg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @variable.builtin guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword.directive.bash guifg=#feff00 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.literal guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=NONE gui=NONE cterm=NONE
hi @symbol guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#BFDBFE ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.5 guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#000000 ctermfg=NONE guibg=#325CC0 ctermbg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @method guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @lsp.type.keyword guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @tag.html guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.link.label guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @operator guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Search guifg=#FFBC5D ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi StatusLineNC guifg=#000000 ctermfg=NONE guibg=#f7f7f7 ctermbg=NONE gui=NONE cterm=NONE
hi @constant.bash guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.list.checked guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi statusline guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#000000 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @tag.delimiter.html guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignColumn guifg=NONE ctermfg=NONE guibg=#f7f7f7 ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.3 guifg=#325CC0 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#000000 ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#7A3E9D ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
