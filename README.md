# vim-fzf-dictionary

Dictionary words completion using fzf user interface.

![intro](intro.gif)


## Installation

* vim-plug
```viml
Plug 'yuki-uthman/vim-fzf-dictionary'
```

* vundle
```viml
Plugin 'yuki-uthman/vim-fzf-dictionary'
```

* minpac:
```viml
call minpac#add('yuki-uthman/vim-fzf-dictionary')

" for lazy loading
call minpac#add('yuki-uthman/vim-fzf-dictionary', { 'type': 'opt' })
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
Row and col are to move around the position of the window relative to the
cursor. Row moves the window down and col moves the window to the right.
```viml
  " default values
  let g:fzf_dictionary_options = #{
        \height: 7,
        \width: 20,
        \row: 0,
        \col: 0,
        \}
```
