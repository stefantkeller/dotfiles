" Use Vim settings, rather than Vi settings (much better!).
" For explanation of remapping etc. see
" https://www.linux.com/news/vim-tips-using-vim-mappings-and-abbreviations
"
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
" display invisible characters (:set list! to toggle between showing them)
" from http://stackoverflow.com/questions/1675688/make-vim-show-all-white-spaces-as-a-character
set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" line numbers and line lengths
set number " show line numbers
set colorcolumn=90 " highlight column 90, soft indication of doc width
set laststatus=2 " always display some file information

" rebind <Leader> key
let mapleader = ","
vnoremap <Leader>s :sort<CR> " map sort function to a key (,s)
" ,n == ^, i.e. 'home' more easily reachable
" ,m == $, i.e. 'end' more easily reachable
map <Leader>n ^" don't put a space between ^ and " of the command!
map <Leader>m $
" after a search is done, turn off highlighting until next search using :noh
map <Leader><Space> :noh<CR>
" toggle between showing invis chars (in listchars) with ,w (for whitespace)
map <Leader>w :set list!<CR>

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

" activate spell check
" https://www.linux.com/learn/using-spell-checking-vim
" useage:
" * cursor on word, type 'z=' to see list of suggested words
" * add word to dictionary through 'zg' (use 'zw' to mark as incorrect)
" note: to turn off use :set nospell (or remapped <Leader>q)
" other possibility is e.g. spelllang=de_ch
set spell spelllang=en_us
map <Leader>q :set nospell<CR>

" read externally changed files
" from http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work/20418591#20418591
au FocusGained,BufEnter * :silent! !

" plugins
"
" https://github.com/tpope/vim-pathogen
" execute pathogen#infect()
