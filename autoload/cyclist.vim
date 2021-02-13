let s:DEBUG = v:true

let s:listchar_options = {
        \ 'eol': '↲',
        \ 'tab': '» ',
        \ 'space': '',
        \ 'trail': '𝁢',
        \ 'extends': '…',
        \ 'precedes': '…',
        \ 'conceal': '┊',
        \ 'nbsp': '☠',
        \ }


function cyclist#update_listchars() abort
    let listchars_mapped = join(map(items(filter(s:listchar_options, { index, key -> key != ''}) ), { index, key -> printf("%s:%s", key[0], key[1]) } ),',')
    echo listchars_mapped
    let &listchars = listchars_mapped
endfunction

function cyclist#set_eol(chars) abort
    let s:listchar_options.eol = a:chars
    call cyclist#update_listchars()
endfunction

function cyclist#set_tab(chars) abort
    let s:listchar_options.tab = a:chars
    call cyclist#update_listchars()
endfunction

function cyclist#set_space(chars) abort
    let s:listchar_options.space = a:chars
    call cyclist#update_listchars()
endfunction

function cyclist#set_trail(chars) abort
    let s:listchar_options.trail = a:chars
    call cyclist#update_listchars()
endfunction

function cyclist#set_extends(chars) abort
    let s:listchar_options.extends = a:chars
    call cyclist#update_listchars()
endfunction

function cyclist#set_procedes(chars) abort
    let s:listchar_options.procedes = a:chars
    call cyclist#update_listchars()
endfunction

function cyclist#set_conceal(chars) abort
    let s:listchar_options.conceal = a:chars
    call cyclist#update_listchars()
endfunction

function cyclist#set_nbsp(chars) abort
    let s:listchar_options.nbsp = a:chars
    call cyclist#update_listchars()
endfunction

call cyclist#update_listchars()
