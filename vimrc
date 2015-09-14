set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

"Vundle Stuff
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'rodjek/vim-puppet'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
call vundle#end()

syntax on
set fo=tcq
set background=dark
colorscheme solarized

" Dark blue comments are not very readable on a dark terminal
highlight comment ctermfg=cyan

"Make the backspace behavior sane
set backspace=indent,eol,start

" Soft tabs please
set tabstop=2
set expandtab
set softtabstop=2
set shiftwidth=2

" Let's make extra nonsense visible

highlight LiteralTabs ctermbg=darkgreen guibg=darkgreen
match LiteralTabs /\s\  /
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/

" Set up puppet manifest and spec options
au BufRead,BufNewFile *.pp
  \ set filetype=puppet
au BufRead,BufNewFile *_spec.rb
  \ nmap <F8> :!rspec --color %<CR>

" Other assorted awesomeness
set nocompatible laststatus=2 showcmd showmode
set incsearch ignorecase smartcase hlsearch
set magic
set shortmess+=I
"Reset filetype plugin in case the OS did something silly between startup and
"here
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
