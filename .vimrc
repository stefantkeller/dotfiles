" Use Vim settings, rather than Vi settings (much better!).
" For explanation of remapping etc. see
" https://www.linux.com/news/vim-tips-using-vim-mappings-and-abbreviations
"
" For more information about a whole bunch of (historical) vi(m) context:
" https://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim
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
set rnu " in fact, show relative numbers
set colorcolumn=90 " highlight column 90, soft indication of doc width
set laststatus=2 " always display some file information

" rebind <Leader> key
let mapleader = ","
map <Leader>r :set rnu!<CR> " use ,r to switch between relative and nonrelative numbers
vnoremap <Leader>s :sort<CR> " map sort function to a key (,s)
" ,n == ^, i.e. 'home' more easily reachable
" ,m == $, i.e. 'end' more easily reachable
map <Leader>n ^" don't put a space between ^ and " of the comment!
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

" https://youtu.be/XA2WjJbmmoM
" see also https://github.com/mcantor (no_plugins, and dotfiles>vim)
" tab-completion for file related tasks
set path+=**
" list mall matching files upon tab complete 
set wildmenu
" `:MakeTags` calls ctags to write the tags;
" from then on use ^] (and ^t to jump back)
" for tag searches
" (sudo apt install exuberant-ctags)
command! MakeTags !ctags -R .
" copy selected stuff into external clipboard using ,c
" (adapted from mentioned YouTube talk, discussion at around 1:00:03
vnoremap <Leader>c "+y

" with ,A achieve equivalent of Ctrl-A + Ctrl-C
" (i.e. select everything and copy to external clipboard)
" very handy to e.g. write in vim and then copy-paste text in gmail
" 1. put mark q at current position of the cursor (mq)
" 2. go to the top of the document (gg)
" 3. select the line (V)
" 4. go to the bottom of the document (G)
" 5. yank all of the selected text to the + register
"    (the externally accessible one)
" 6. jump back to the q mark (`q)
nnoremap <Leader>A mqggVG"+y`q

" save folds in vim {{{
" http://vim.wikia.com/wiki/VimTip991
" also, as a reminder
" (http://vim.wikia.com/wiki/Folding)
" create folds using zf{movement}
" open fold using zo
" close fold (from within a fold) zc
" hence, to create these .vimrc folds: zf/}}}
" (except for this fold, because the closing mark in the explanation,
" here a simple zf} because there is no emply line in the paragraph)
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
" }}}"

" auto-close parentheses and the like {{{
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
"inoremap ' ''<left>" this one is annoying whenever writing English: you're', don't', etc.
inoremap " ""<left>
inoremap /* /**/<left><left>
inoremap `` ``''<left><left>
""inoremap ` `'<left>" this is handy iff in LaTeX, otherwise it's annoying
" }}}

" plugins
"
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" https://github.com/vim-airline/vim-airline
" https://github.com/tpope/vim-abolish
