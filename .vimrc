syntax on
set fo=tcq

" Dark blue comments are not very readable on a black terminal
highlight comment ctermfg=cyan

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
execute pathogen#infect()
filetype off
filetype plugin indent on
let g:Powerline_symbols = 'fancy'
