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


inoremap <Plug>(fzf-dictionary-open) <cmd>call fzf#dictionary#open()<CR>

"=============================================================================

" restore the &cpo

let &cpo=s:cpo_save
"=============================================================================
