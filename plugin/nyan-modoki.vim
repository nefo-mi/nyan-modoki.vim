scriptencoding utf-8

let s:catface = [
        \ ['[]*','[]#'],
        \ ['(*^ｰﾟ)ﾆｬﾝ','( ^ｰ^)ﾆｬﾝ','ﾆｬﾝ(^ｰ^ )','ﾆｬﾝ(ﾟｰ^*)'],
        \ ['(´ω｀三   )みょく ', '( ´ω三｀  )みょく ', '(  ´三ω｀ )みょく ', '(   三´ω｀)みょく ', 
        \  '(   三´ω｀)みょく ', '(  ´三ω｀ )みょく ', '( ´ω三｀  )みょく ', '(´ω｀三   )みょく '], 
        \ ['ﾊｧﾊｧ(´д｀;)','( ´д`;)ﾊｧﾊｧ','( ;´д`)ﾊｧﾊｧ','(;´д` )ﾊｧﾊｧ'],
        \ ['(」・ω・)」うー！　', '(／・ω・)／にゃー！', '(」・ω・)」うー！　', '(／・ω・)／にゃー！', 
        \  '(」・ω・)」うー！　', '(／・ω・)／にゃー！', '(」・ω・)」うー！　', "Let's＼(・ω・)／にゃー！"], 
        \ ['┌(┌　^ o^)┐　', '┌(　┐^ o^)┐　', '　┐ ┐^ o^)┐　', '三┌(┌　^ o^)　', '　┌(┌　^ o^)┐'],
        \ ['(＞ワ＜三　　　)コシコシコシ', '(　＞ワ三＜　　)コシコシコシ',
        \  '(　　＞三ワ＜　)コシコシコシ', '(　　　三＞ワ＜)コシコシコシ',
        \  '(　　＞三ワ＜　)コシコシコシ', '(　＞ワ三＜　　)コシコシコシ']
\ ]

function! g:NyanModoki()
  let s:catnum = get(g:, "nyan_modoki_select_cat_face_number", 0)
  let s:anim = get(g:, "nayn_modoki_animation_enabled", 1)
  if s:anim >= 1
    let nyanpos = get(w:, "nyanpos", -1) + 1
    let nyanpos = nyanpos % len(s:catface[s:catnum])
    let w:['nyanpos'] = nyanpos
  else
     let nyanpos = 0
  endif
  let s:maxlen = winwidth(0) / 2 - strlen(s:catface[s:catnum][nyanpos])
  let s:cur = line(".") * s:maxlen / line("$") - 1
  let s:fil = s:maxlen - s:cur - 1
  return " ".repeat("|", s:cur).s:catface[s:catnum][nyanpos].repeat("-", s:fil)." "
endfunction
