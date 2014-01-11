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

" == NERDTree settings =========================================
let g:NERDTreeShowHidden = 1
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <C-D> :NERDTreeToggle<CR>

" == MiniBufExplorer settings ==================================
let g:miniBufExplCycleArround = 1
let g:miniBufExplUseSingleClick = 1
noremap <C-S-TAB> :MBEbp<CR>
noremap <C-TAB> :MBEbn<CR>
