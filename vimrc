let mapleader = ","
let maplocalleader = ";"

syntax on

set nocompatible
filetype off
set rtp+=~/.vim-pivotal/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

for bundle in [ '~/.vim-pivotal/vimrc.bundles', '~/.vim-pivotal/vimrc.ruby.bundles' ]
  if filereadable(expand(bundle))
    execute "source " . expand(bundle)
  endif
endfor

call vundle#end()

filetype plugin indent on

for config in [ '~/.vim-pivotal/vimrc.config', '~/.vim-pivotal/vimrc.ruby.config' ]
  if filereadable(expand(config))
    execute "source " . expand(config)
  endif
endfor

if filereadable($HOME . "/.vimrc.local")
  source ${HOME}/.vimrc.local
endif
