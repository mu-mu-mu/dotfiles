syntax enable
set nowrap

set ruler
set number
set wildmenu
set showcmd


"Split Window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Beep off
set visualbell t_vb=

"search
vnoremap * "zy:let @/ = @z<CR>n

set clipboard=unnamedplus

set nrformats=

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

filetype plugin indent on

if has('gui_running')
    autocmd ColorScheme * highlight Normal ctermbg=none
    autocmd ColorScheme * highlight LineNr ctermbg=none
    set background=dark
else
    set background=dark
endif

autocmd ColorScheme * highlight Comment guifg=#118811
autocmd ColorScheme * highlight LineNr guifg=#999999
colorscheme jellybeans

" Anywhere SID.
function! s:SID_PREFIX()
  return matchstr(expand('<sfile>'), '<SNR>\d\+_\zeSID_PREFIX$')
endfunction

" Set tabline.
function! s:my_tabline()  "{{{
  let s = ''
  for i in range(1, tabpagenr('$'))
    let bufnrs = tabpagebuflist(i)
    let bufnr = bufnrs[tabpagewinnr(i) - 1]  " first window, first appears
    let no = i  " display 0-origin tabpagenr.
    let mod = getbufvar(bufnr, '&modified') ? '!' : ' '
    let title = fnamemodify(bufname(bufnr), ':t')
    let title = '[' . title . ']'
    let s .= '%'.i.'T'
    let s .= '%#' . (i == tabpagenr() ? 'TabLineSel' : 'TabLine') . '#'
    let s .= no . ':' . title
    let s .= mod
    let s .= '%#TabLineFill# '
  endfor
  let s .= '%#TabLineFill#%T%=%#TabLine#'
  return s
endfunction "}}}
let &tabline = '%!'. s:SID_PREFIX() . 'my_tabline()'

set showtabline=2 " 常にタブラインを表示

set ignorecase
set smartcase
set smartindent

set hlsearch
nnoremap <F3> :noh<CR>
set incsearch

set laststatus=2

"TAB
set shiftwidth=2
set softtabstop=2
set expandtab
set tabstop=8
set smarttab

"ctags rules
nnoremap <f5> :!ctags -R<CR>

"
inoremap <f15> <Nop>
inoremap <f16> <Nop>

"Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 1
let g:airline#extensions#default#section_truncate_width = {}
let g:airline_theme = 'wombat'

nnoremap <Right> :tabnext<CR>
nnoremap <Left> :tabprevious<CR>
nnoremap <Up> :bp<CR>
nnoremap <Down> :bn<CR>

"NERDTree
nnoremap <silent><C-e> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" 引数なしでvimを開くとNERDTreeを起動
let file_name = expand('%')
if has('vim_starting') &&  file_name == ''
  autocmd VimEnter * NERDTree ./
endif


"Indentline
let g:indentLine_char = '¦'

set completeopt=menuone

set cursorline

syntax enable
