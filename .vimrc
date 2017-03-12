
syntax enable
set nowrap

"High Light
set hlsearch
nnoremap <F3> :noh<CR>


set ignorecase
set smartcase

"Ferquentry Use Commands
nnoremap q b
nnoremap b q


set smartindent

set ruler
set number
set wildmenu
set showcmd

"TAB
set shiftwidth=4
set softtabstop=4
set expandtab
set tabstop=4
set smarttab

"Split Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Beep off
set visualbell t_vb=
    
set clipboard=unnamed


filetype plugin indent off


"[config] dein.vim <start>
if &compatible
  set nocompatible               
endif

let s:dein_dir = expand('~/.vim/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'


if has('vim_starting')
    if &runtimepath !~# '/dein.vim'
        if !isdirectory(s:dein_repo_dir)
            execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
        endif
        let &runtimepath = &runtimepath . "," . s:dein_repo_dir

    endif
endif



if dein#load_state(s:dein_dir)
    call dein#begin(s:dein_dir)
   
    call dein#load_toml('~/.vim/rc/dein.toml', { 'lazy': 0 })
    call dein#load_toml('~/.vim/rc/dein_lazy.toml', { 'lazy': 1 })

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
	call dein#install()
endif

"[config] dein.vim <end> 

filetype plugin indent on
