" Use Vim settings, rather than Vi settings
set nocompatible

" Allow overriding settings at beginning of vimrc
if filereadable(expand("~/.vimrc.before"))
  source ~/.vimrc.before
endif

" ======== General Config =========

set number
set backspace=indent,eol,start
set history=1000
set showcmd
set showmode
set gcr=a:blinkon0
set visualbell
set autoread

set hidden

syntax on

" Change mapleader command to something more reasonable
let mapleader=","

" ========= Vundle INitialization ========
" Load all the plugins found in vundle
if filereadable(expand("~/.vim/vundles.vim"))
  source ~/.vim/vundles.vim
endif

" ======== Swap files ========

set noswapfile
set nobackup
set nowb

" ======= Persistent Undo =========
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" ========= Indentation ==========

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

filetype plugin on
filetype indent on

set list listchars=tab:\ \ ,trail:·

set nowrap
set linebreak

" =========== Folds ============

set foldmethod=indent
set foldnestmax=3
set nofoldenable

" ========== Completion ============

set wildmode=list:longest
set wildmenu           "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ========= Scrolling =========

set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" ======== Custom Settings =========
if filereadable(expand("~/.vim/settings.vim"))
  so ~/.vim/settings.vim
endif
