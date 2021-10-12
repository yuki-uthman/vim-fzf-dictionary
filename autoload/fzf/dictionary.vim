"=============================================================================
" fzf-dictionary
"
" Author: Yuki Yoshimine <yuki.uthman@gmail.com>
" Source: https://github.com/yuki-uthman/fzf-dictionary.vim
"
"=============================================================================
" Description: fzf for dictionary completion


"=============================================================================
let s:cpo_save=&cpo
set cpo&vim
"=============================================================================

function! s:get_previous_word()
  let lig = getline(line('.'))
  let lig = strpart(lig,0,col('.')-1)
  return matchstr(lig, '\<\k*\>\s*$')
endfunction

function! s:open_dictionary(options) abort

  let word = s:get_previous_word()

  " -I no file name 
  " -s case-sensitive
  let cmd = "rg -I --case-sensitive '" .. word .. "' " .. join(split(&dictionary, ','))

  let height = a:options.height
  let width = a:options.width
  let adjust_row = a:options.row
  let adjust_col = a:options.col

  let line = winline()
  let col = wincol()
  let yoffset =  ( line - 1.0 + adjust_row ) / (&lines - height)
  
  let len = len(word)
  let xoffset =  ( col - 3.0 - len + adjust_col) / (&columns - width)

  let reverse = v:false
  if yoffset > 1
    let reverse = v:true
    let yoffset =  ( line - height - 0.0 - adjust_row) / (&lines - height)
  endif

  " +i case sensitive flag for fzf
  " let options = ['+i']
  let options = []

  if reverse
    call extend(options, ['--layout=default'] )
  endif

  let window = #{
        \yoffset: yoffset, 
        \xoffset: xoffset, 
        \height: height, 
        \width: width, 
        \border: "none"}

  let dict = #{
        \source: cmd,
        \window: window,
        \options: options
        \}

   call fzf#vim#complete(cmd, dict)
endfunc

function! fzf#dictionary#open(options) abort

  call s:open_dictionary(a:options)
endfunc

"=============================================================================
let &cpo=s:cpo_save
"=============================================================================
