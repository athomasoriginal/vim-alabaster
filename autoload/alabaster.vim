" -----------------------------------------------------------------------------
" File: alabaster.vim
" Description: Alabaster theme
" Author: thomas <thomasmattacchione@gmail.com>
" Source: ...
" Last Modified: Mar 30, 2022
" -----------------------------------------------------------------------------

function! alabaster#invert_signs_toggle()
  if g:alabaster_invert_signs == 0
    let g:alabaster_invert_signs=1
  else
    let g:alabaster_invert_signs=0
  endif

  colorscheme alabaster
endfunction

" Search Highlighting {{{

function! alabaster#hls_show()
  set hlsearch
  call alabasterHlsShowCursor()
endfunction

function! alabaster#hls_hide()
  set nohlsearch
  call alabasterHlsHideCursor()
endfunction

function! alabaster#hls_toggle()
  if &hlsearch
    call alabaster#hls_hide()
  else
    call alabaster#hls_show()
  endif
endfunction

" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
