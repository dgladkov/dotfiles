set nocompatible

" == Vundle config =============================================
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/csv.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/syntastic'
Plugin 'plasticboy/vim-markdown'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-repeat'
Plugin 'Valloric/YouCompleteMe'
Plugin 'elzr/vim-json'

call vundle#end()
filetype plugin indent on

" == general settings ==========================================
syntax on
" switch between buffers without saving
set hidden
" show line numbers
set number
" ingelligent case (in)sensitive search
set smartcase
" close buffer without closing window split
noremap <Leader>c :bp<bar>bd #<CR>

set smartindent
set autoindent

" always show status line
set laststatus=2

" == color scheme ==============================================
colorscheme molokai

" == tab navigation settings ===================================
nnoremap <C-t> :tabnew<CR>
nnoremap <C-Tab> :bnext<CR>
nnoremap <C-S-Tab> :bprevious<CR>

" == NERDTree settings =========================================
let g:NERDTreeShowHidden = 1

" always show NERDTree
autocmd VimEnter * if !argc() | NERDTree | endif
autocmd BufEnter * NERDTreeMirror
autocmd VimEnter * wincmd w

" close vim if only NERDTree buffer is left
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nmap <silent> <C-D> :NERDTreeToggle<CR>

" == vim-airline settings ======================================
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" == unite settings / bling ====================================
nnoremap <C-p> :Unite file_rec/async<cr>
if executable('ag')
  let g:unite_source_grep_command='ag'
  let g:unite_source_grep_default_opts='--nocolor --nogroup -S -C4'
  let g:unite_source_grep_recursive_opt=''
endif
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>

" == syntastic =================================================
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html']
\}

" == markdown settings =========================================
let g:vim_markdown_folding_disabled=1

" == gundo settings ============================================
nnoremap <F5> :GundoToggle<CR>
