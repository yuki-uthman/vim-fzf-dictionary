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

function! s:default() abort
  return #{
        \height: 7,
        \width: 20,
        \down: 0,
        \right: 0,
        \}
endfunc

function! s:init_fzf_dictionary() abort
  let obj = {}
  let obj = get(g:, 'fzf_dictionary_options', s:default())

  return obj
endfunction

function! s:get_previous_word()
  let lig = getline(line('.'))
  let lig = strpart(lig,0,col('.')-1)
  return matchstr(lig, '\<\k*\>\s*$')
endfunction

function! s:add_space(lines)
  return a:lines[0] .. " "
endfunction

function! s:open_dictionary() abort

  let options = s:init_fzf_dictionary()

  let word = s:get_previous_word()

  " -I no file name 
  " -s case-sensitive
  " ^chars to make it match only at the beginning of the word
  let cmd = "rg -I --case-sensitive '^" .. word .. "' " .. join(split(&dictionary, ','))

  let height = options.height
  let width = options.width
  let adjust_row = options.down
  let adjust_col = options.right

  let line = winline()
  let col = wincol()
  let yoffset =  ( line - 0.0 + adjust_row ) / (&lines - height)
  
  let len = len(word)
  let xoffset =  ( col - 1.0 - len + adjust_col) / (&columns - width)

  let reverse = v:false
  if yoffset > 1
    let reverse = v:true
    let yoffset =  ( line - height + 1.0 - adjust_row) / (&lines - height)
    let xoffset =  ( col - 1.0 - len + adjust_col) / (&columns - width)
  endif

  " +i case sensitive flag for fzf
  " let options = ['+i']
  " remove prompt arrow
  let options = ['--prompt=']

  " use space to enter
  call extend(options, ['--bind=space:accept'] )

  " go to the first line when query change
  call extend(options, ['--bind=change:first'] )


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
        \reducer: function('s:add_space'),
        \options: options
        \}

   call fzf#vim#complete(cmd, dict)
endfunc

function! fzf#dictionary#open() abort

  call s:open_dictionary()
endfunc

"=============================================================================
let &cpo=s:cpo_save
"=============================================================================
