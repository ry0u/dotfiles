" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

" You can also specify a different font, overriding the default font
"if has('gui_gtk2')
"  set guifont=Bitstream\ Vera\ Sans\ Mono\ 12
"else
"  set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
"endif

" If you want to run gvim with a dark background, try using a different
" colorscheme or running 'gvim -reverse'.
" http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/ has examples and
" downloads for the colorschemes on vim.org

" Source a global configuration file if available
if filereadable("/etc/vim/gvimrc.local")
  source /etc/vim/gvimrc.local
endif

if has('vim_starting')
	autocmd VimEnter * call s:Transset("0.85")
endif

"Transset
function! s:Transset(opacity)
	call system('transset --id ' . v:windowid . ' ' . a:opacity)
endfunction
command! -nargs=1 Transset call <SID>Transset(<q-args>) 

" set guifont
function! s:ChangeFontSize(size)
	execute ':set guifont=DejaVu\ Sans\ Mono\' a:size
endfunction
command! -nargs=1 CF call <SID>ChangeFontSize(<q-args>)


set guifont=DejaVu\ Sans\ Mono\ 13
set nocompatible
set columns=106
set lines=42
set guioptions-=m
set guioptions-=T

