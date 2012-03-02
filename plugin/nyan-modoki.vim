scriptencoding utf-8

if !has('unix') || ($VTE_CJK_WIDTH != '' && &ambiwidth == 'double')
  let s:catface = [
  \ ['[]*','[]#'],
  \ ['(*^ｰﾟ)','( ^ｰ^)','(^ｰ^ )','(ﾟｰ^*)'],
  \ ['(´д｀;)','( ´д`;)','( ;´д`)','(;´д` )']]
else
  let s:catface = [
  \ ['[]*','[]#'],
  \ ['(*^ｰﾟ)','( ^ｰ^)','(^ｰ^ )','(ﾟｰ^*)'],
  \ ['(´ д｀; )','( ´ д `;)','( ;´ д `)','(;´ д ` )']]
endif

let s:sing = ['', 'ﾆｬﾝ', 'ﾊｧﾊｧ']

function! g:NyanModoki()
  let s:catnum = get(g:, "nyan_modoki_select_cat_face_number", 0)
  let s:anim = get(g:, "nayn_modoki_animation_enabled", 0)
  if s:anim >= 1
    let nyanpos = get(w:, "nyanpos", -1) + 1
    let nyanpos = nyanpos % len(s:catface[s:catnum])
    let w:['nyanpos'] = nyanpos
  else
     let nyanpos = 0
  endif
  let s:maxlen = winwidth(0) / 2 - strlen(s:catface[s:catnum][nyanpos]) - strlen(s:sing[s:catnum])
  let s:cur = line(".") * s:maxlen / line("$") - 1
  let s:fil = s:maxlen - s:cur - 1
  return " ".repeat("|", s:cur).s:catface[s:catnum][nyanpos].s:sing[s:catnum].repeat("-", s:fil)." "
endfunction
