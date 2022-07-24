" Maintainer: Thomas <thomasmattacchione@gmail.com>
set background=dark
hi clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name='alabaster-dark'

function! InsertStatuslineColor(mode)
  if a:mode == 'i'
    hi statusline guibg=#383838

  elseif a:mode == 'r'
    hi statusline guibg=#383838

  else
    hi statusline guibg=#383838
  endif
endfunction

au InsertEnter * call InsertStatuslineColor(v:insertmode)
au InsertChange * call InsertStatuslineColor(v:insertmode)
au InsertLeave * hi statusline guibg=#383838

" default the statusline to green when entering Vim
hi statusline guibg=#383838
hi Normal guifg=#cecece ctermfg=252 guibg=#0c1415 ctermbg=233 gui=NONE cterm=NONE
hi Comment guifg=#e3e392 ctermfg=186 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpecialComment guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Todo guifg=#e3e392 ctermfg=186 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Constant guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Number guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Boolean guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Float guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Keyword guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Identifier guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Function guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi String guifg=#9ed187 ctermfg=150 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Character guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Statement guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Conditional guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Repeat guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Label guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Operator guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Exception guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreProc guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Include guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Define guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Title guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Macro guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi PreCondit guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Type guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi StorageClass guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Structure guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Typedef guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Special guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MoreMsg guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Error guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WarningMsg guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi WildMenu guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi EndOfBuffer guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellBad guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi TermCursor guifg=#ffbc5d ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Cursor guifg=NONE ctermfg=NONE guibg=NONE ctermbg=NONE gui=reverse cterm=reverse
hi ColorColumn guifg=NONE ctermfg=NONE guibg=#383838 ctermbg=237 gui=NONE cterm=NONE
hi CursorLineNr guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=bold cterm=bold
hi SignColumn guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=233 gui=NONE cterm=NONE
hi Conceal guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi CursorColumn guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=233 gui=NONE cterm=NONE
hi Directory guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi DiffAdd guifg=#0c1415 ctermfg=233 guibg=#e3e392 ctermbg=186 gui=NONE cterm=NONE
hi DiffChange guifg=#e3e392 ctermfg=186 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi DiffDelete guifg=#0c1415 ctermfg=233 guibg=#aa3731 ctermbg=131 gui=NONE cterm=NONE
hi DiffText guifg=#0c1415 ctermfg=233 guibg=#e3e392 ctermbg=186 gui=NONE cterm=NONE
hi ErrorMsg guifg=#aa3731 ctermfg=131 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi VertSplit guifg=#696969 ctermfg=242 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Folded guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi FoldColumn guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi LineNr guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi MatchParen guifg=#0c1415 ctermfg=233 guibg=#5dafec ctermbg=75 gui=NONE cterm=NONE
hi NonText guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi Pmenu guifg=#cecece ctermfg=252 guibg=#0c1415 ctermbg=233 gui=NONE cterm=NONE
hi PmenuSel guifg=NONE ctermfg=NONE guibg=#204273 ctermbg=24 gui=NONE cterm=NONE
hi PmenuSbar guifg=NONE ctermfg=NONE guibg=#cecece ctermbg=252 gui=NONE cterm=NONE
hi PmenuThumb guifg=NONE ctermfg=NONE guibg=#cecece ctermbg=252 gui=NONE cterm=NONE
hi Question guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi QuickFixLine guifg=#0c1415 ctermfg=233 guibg=#e3e392 ctermbg=186 gui=NONE cterm=NONE
hi IncSearch guifg=#0c1415 ctermfg=233 guibg=#ffbc5d ctermbg=215 gui=NONE cterm=NONE
hi Search guifg=#0c1415 ctermfg=233 guibg=#ffbc5d ctermbg=215 gui=NONE cterm=NONE
hi SpecialKey guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi SpellCap guifg=#aa3731 ctermfg=131 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellLocal guifg=#aa3731 ctermfg=131 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi SpellRare guifg=#aa3731 ctermfg=131 guibg=NONE ctermbg=NONE gui=underline cterm=underline
hi StatusLineNC guifg=#cecece ctermfg=252 guibg=#c6cbd2 ctermbg=252 gui=NONE cterm=NONE
hi StatusLine guifg=#cecece ctermfg=252 guibg=#383838 ctermbg=237 gui=NONE cterm=NONE
hi CursorLine guifg=#cecece ctermfg=252 guibg=#383838 ctermbg=237 gui=NONE cterm=NONE
hi TabLine guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineSel guifg=#383838 ctermfg=237 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TabLineFill guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=233 gui=NONE cterm=NONE
hi Terminal guifg=#cecece ctermfg=252 guibg=#0c1415 ctermbg=233 gui=NONE cterm=NONE
hi Visual guifg=NONE ctermfg=NONE guibg=#204273 ctermbg=24 gui=NONE cterm=NONE
hi VisualNOS guifg=NONE ctermfg=NONE guibg=#0c1415 ctermbg=233 gui=NONE cterm=NONE
hi TSError guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctDelimiter guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctBracket guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSPunctSpecial guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstant guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstBuiltin guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSString guifg=#9ed187 ctermfg=150 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStringEscape guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSCharacter guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNumber guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSInclude guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSNamespace guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncBuiltin guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFunction guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSFuncMacro guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameter guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSParameterReference guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSMethod guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSField guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSProperty guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConstructor guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSConditional guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSRepeat guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLabel guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeyword guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordFunction guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSKeywordOperator guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSOperator guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSException guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSType guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTypeBuiltin guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStructure guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariable guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSVariableBuiltin guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSText guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSStrong guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSEmphasis guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSUnderline guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTitle guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSLiteral guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSURI guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTag guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TSTagDelimiter guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi TelescopeMatching guifg=#ffbc5d ctermfg=215 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownTSPunctDelimiter guifg=#e3e392 ctermfg=186 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdown_inlineTSPunctDelimiter guifg=#789395 ctermfg=245 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownTSPunctSpecial guifg=#789395 ctermfg=245 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdown_inlineTSPunctSpecial guifg=#789395 ctermfg=245 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdownTSTitle guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdown_inlineTSEmphasis guifg=#789395 ctermfg=245 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdown_inlineTSLiteral guifg=#789395 ctermfg=245 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi markdown_inlineTSStrong guifg=#789395 ctermfg=245 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSNamespace guifg=#5dafec ctermfg=75 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSSymbol guifg=#d787cd ctermfg=176 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSConditional guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSVariable guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSKeywordFunction guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSFuncMacro guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSType guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSKeyword guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
hi clojureTSException guifg=#cecece ctermfg=252 guibg=NONE ctermbg=NONE gui=NONE cterm=NONE
