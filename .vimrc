" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

set backspace=indent,eol,start " allow backspacing over everything (as expected) 
set mouse=a     " activate mouse (usually not necessary with vim, but for those few cases...)
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching
set hlsearch            " highlight last used search pattern
set ignorecase          " not case sensitive search

" use spaces rather than tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" default clipboard doesn't allow to paste stuff from outside of vim
set clipboard=unnamed " allow copy past to work as would be expected

" Enable syntax highlighting (reload file for change to apply)
filetype on
filetype plugin on
filetype indent on
syntax enable

" line numbers and line lengths
set number " show line numbers
set colorcolumn=90 " highlight column 90, soft indication of doc width

" rebind <Leader> key
let mapleader = ","
vnoremap <Leader>s :sort<CR> " map sort function to a key (,s)

" highlighting stuff in v and then moving it with '>' works only once
" then it loses the selection
" the following allows to keep the selection
vnoremap < <gv
vnoremap > >gv

" enable long history
set history=700
set undolevels=700

" disable automatic vim backup/swap files
set nobackup
set nowritebackup
set noswapfile
