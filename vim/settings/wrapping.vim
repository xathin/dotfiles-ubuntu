" http://vimcasts.org/episodes/soft-wrapping-text/
function! SetupWrapping()
  set wrap linebreak nolist
  set showbreak=…
endfunction

" TODO: this should happen automatically for certain file types
command! -nargs=* Wrap :call SetupWrapping()<CR>
