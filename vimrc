set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle Stuff
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

syntax on
set fo=tcq
set background=dark

" Dark blue comments are not very readable on a dark terminal
highlight comment ctermfg=cyan

"Make the backspace behavior sane
set backspace=indent,eol,start

" Real tabs please, but make them smaller for Python
set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab

" Let's make extra nonsense visible
highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Other assorted awesomeness
set nocompatible laststatus=2 showcmd showmode
set incsearch ignorecase smartcase hlsearch
set magic
set shortmess+=I

"Reset filetypes in case the OS did something silly between startup and now
filetype off
filetype plugin indent on

" Git gutter colors
highlight clear SignColumn
highlight GitGutterChange ctermfg=3 ctermbg=0
highlight GitGutterDelete ctermfg=9 ctermbg=0
highlight GitGutterAdd ctermfg=2 ctermbg=0
highlight GitGutterChangeDelete ctermfg=4 ctermbg=0
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_enable_syntastic = 1
let g:airline_theme = 'powerlineish'
