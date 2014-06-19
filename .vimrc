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
