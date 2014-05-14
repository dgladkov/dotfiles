execute pathogen#infect()

" == general settings ==========================================
set nocompatible
syntax on
filetype plugin indent on
set hidden
set number
" close buffer without closing window split
noremap <Leader>c :bp<bar>bd #<CR>

set smartindent
set autoindent

" always show status line
set laststatus=2

" == color scheme with custom line number colors ===============
colorscheme molokai

if exists("g:molokai_original")
    let s:molokai_original = g:molokai_original
else
    let s:molokai_original = 0
endif

if s:molokai_original == 1
   hi LineNr guifg=#BCBCBC guibg=#272822
else
   hi LineNr guifg=#465457 guibg=#1B1D1E
endif

" == tab navigation settings ===================================
noremap <C-t>     :tabnew<CR>

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
let g:airline#extensions#branch#enabled = 1
let g:airline_powerline_fonts = 1
