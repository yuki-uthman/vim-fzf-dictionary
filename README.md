# vim-fzf-dictionary

Dictionary words completion using fzf user interface.

![intro](intro.gif)


## Installation


### External Dependencies
fzf and ripgrep are binary executables and you need both of them to be in the 
$PATH.

* fzf [installation](https://github.com/junegunn/fzf#installation)
* ripgrep [installation](https://github.com/BurntSushi/ripgrep#installation)

### Vim Plugin Dependencies
fzf.vim is a vimscript wrapper around fzf and you have to install it together.

* vim-plug
```viml
" for fzf wrapper
Plug 'junegunn/fzf.vim'

Plug 'yuki-uthman/vim-fzf-dictionary'
```

* vundle
```viml
" for fzf wrapper
Plugin 'junegunn/fzf.vim'

Plugin 'yuki-uthman/vim-fzf-dictionary'
```

* minpac:
```viml
" for fzf wrapper
call minpac#add('junegunn/fzf.vim')
call minpac#add('yuki-uthman/vim-fzf-dictionary')

" for lazy loading
call minpac#add('junegunn/fzf.vim', { 'type': 'opt'})
call minpac#add('yuki-uthman/vim-fzf-dictionary', { 'type': 'opt' })
packadd fzf.vim
packadd vim-fzf-dictionary
```


## Quickstart

No default mappings are provided with this plugin.
Put this in your init.vim.
```viml
  " change the key bindings to your liking
  imap <C-K> <Plug>(fzf-dictionary-open)
```


## Configurations

You can customize the size and the position of the fzf window.
Down and right are to adjust the position of the window relative to the
cursor. Down and right moves the window down and right respectively.
```viml
  " default values
  let g:fzf_dictionary_options = #{
        \height :   7,
        \width  :  20,
        \down   :   0,
        \right  :   0,
        \}
```
