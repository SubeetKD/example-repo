echo "this has been sourced"

" Rather than this
" call cyclist#example()

nnoremap <Plug>CyclistExample :call cyclist#example()<cr>

nmap <leader>cc <Plug>CyclistExample
