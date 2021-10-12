"=============================================================================
" Plugin:      fzf-dictionary
" Description: fzf for dictionary completion
"
" Author: Yuki Yoshimine <yuki.uthman@gmail.com>
" Source: https://github.com/yuki-uthman/fzf-dictionary.vim
"
"=============================================================================

" Avoid global reinclusion  

if exists("g:loaded_fzf_dictionary")
  finish
endif
let g:loaded_fzf_dictionary = 1

let s:cpo_save=&cpo
set cpo&vim

"=============================================================================

function! s:default() abort
  return #{
        \height: 7,
        \width: 20,
        \row: 0,
        \col: 0,
        \}
endfunc

function! s:init_fzf_dictionary() abort
  let obj = {}
  let obj = get(g:, 'fzf_dictionary_options', s:default())


  return obj
endfunction

let options = s:init_fzf_dictionary()

inoremap <Plug>(fzf-dictionary-open) <cmd>call fzf#dictionary#open(options)<CR>

"=============================================================================

" restore the &cpo

let &cpo=s:cpo_save
"=============================================================================
