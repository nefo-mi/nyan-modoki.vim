scriptencoding utf-8

let s:cat = [
\ '[]*',
\ '(*^ｰﾟ)ﾉ',
\ '(=^ωﾟ)ﾉ',
\ 'ｽﾞｻｰc⌒っﾟДﾟ)っ']

function! g:NyanModoki()
    let s:catnum = get(g:, "nyan_modoki_select_cat_face_number", 0)
    let s:maxlen = winwidth(0)/2-strlen(s:cat[s:catnum]) 
    let s:cur = line(".") * s:maxlen / line("$") - 1
    let s:fil = s:maxlen - s:cur - 1
    return " ".repeat("|", s:cur).s:cat[s:catnum].repeat("-", s:fil)." "
endfunction
