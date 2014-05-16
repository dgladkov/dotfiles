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
nnoremap <space>/ :Unite grep:.<cr>
let g:unite_source_history_yank_enable = 1
nnoremap <space>y :Unite history/yank<cr>
