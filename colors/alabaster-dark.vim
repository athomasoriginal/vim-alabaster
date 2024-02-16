" Vim syntax file
" Languages: Markdown, Clojure
" Maintainer: Thomas Mattacchione
" Last Changed: Dec 18, 2022
set background=dark

hi clear

if exists ('syntax_on')
  syntax reset
endif

let g:colors_name='alabaster-dark'

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
hi Pmenu guifg=#CECECE ctermfg=NONE guibg=#0c1415 ctermbg=NONE gui=NONE cterm=NONE
hi @markup.strong guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi @markup.heading.6 guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.raw.markdown_inline guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Terminal guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @function.builtin guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi NonText guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorLine guifg=#CECECE ctermfg=NONE guibg=#383838 ctermbg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#383838 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @function guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.6.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Comment guifg=#e3e392 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.1.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @tag.attribute.css guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=NONE gui=NONE cterm=NONE
hi @lsp.mod.definition guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.raw.block guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword.function guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @string.escape.javascript guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.2.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiagnosticUnnecessary guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.special.bash guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @conditional guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @label guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @include guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.special guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @repeat guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#0c1415 ctermfg=NONE guibg=#e3e392 ctermbg=NONE gui=NONE cterm=NONE
hi StatusLine guifg=#CECECE ctermfg=NONE guibg=#383838 ctermbg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#0c1415 ctermfg=NONE guibg=#e3e392 ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi Question guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @constant.css guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffDelete guifg=#0c1415 ctermfg=NONE guibg=#AA3731 ctermbg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#CECECE ctermbg=NONE gui=NONE cterm=NONE
hi @function.css guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @type.javascript guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @constant.builtin guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#FFBC5D ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi Directory guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @string.escape guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.4 guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi IncSearch guifg=#FFBC5D ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi Folded guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @tag.css guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ErrorMsg guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.strikethrough.markdown_inline guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.4.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#383838 ctermbg=NONE gui=NONE cterm=NONE
hi TabLine guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @namespace guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.1 guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @label.bash guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.uri guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @markup.list guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#9ed187 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.bracket guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @function.call guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.3.marker guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @variable guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PmenuSel guifg=NONE ctermfg=NONE guibg=#204273 ctermbg=NONE gui=NONE cterm=NONE
hi Conceal guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @string.special.symbol guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi title guifg=#9ed187 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialKey guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffChange guifg=#e3e392 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @markup.heading.2 guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword.operator.javascript guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.italic.markdown_inline guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.list.unchecked guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Todo guifg=#e3e392 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Normal guifg=#CECECE ctermfg=NONE guibg=#0c1415 ctermbg=NONE gui=NONE cterm=NONE
hi @punctuation.delimiter guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @lsp.type.namespace guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorLineNr guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=bold cterm=NONE
hi Cursor guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=NONE
hi @constructor.javascript guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.raw.delimiter guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffText guifg=#0c1415 ctermfg=NONE guibg=#e3e392 ctermbg=NONE gui=NONE cterm=NONE
hi SpellLocal guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @variable.builtin guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @keyword.directive.bash guifg=#e3e392 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.literal guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=NONE gui=NONE cterm=NONE
hi @symbol guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#204273 ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.5 guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#0c1415 ctermfg=NONE guibg=#5dafec ctermbg=NONE gui=NONE cterm=NONE
hi SpellRare guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=NONE
hi @method guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @lsp.type.keyword guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @tag.html guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.link.label guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @operator guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Search guifg=#FFBC5D ctermfg=NONE guibg=NONE ctermbg=NONE gui=undercurl cterm=undercurl
hi StatusLineNC guifg=#CECECE ctermfg=NONE guibg=#CECECE ctermbg=NONE gui=NONE cterm=NONE
hi @constant.bash guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi @markup.list.checked guifg=#789395 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi statusline guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#CECECE ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SignColumn guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=NONE gui=NONE cterm=NONE
hi @markup.heading.3 guifg=#5dafec ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#CECECE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#d787cd ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#AA3731 ctermfg=NONE guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
