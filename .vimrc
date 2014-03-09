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

" CycleBuffer - Cycle Through Buffers {{{
"
" Move to next or previous buffer in the current window. If there 
" are no more modifiable buffers then stay on the current buffer.
" can be called with no parameters in which case the buffers are
" cycled forward. Otherwise a single argument is accepted, if 
" it's 0 then the buffers are cycled backwards, otherwise they
" are cycled forward.
"
function! <SID>CycleBuffer(forward)

  " Th
  " Skip any non-modifiable buffers, but don't cycle forever
  " This should stop us from stopping in any of the [Explorers]
  while getbufvar(l:curBuf, '&modifiable') == 0 && l:origBuf != l:curBuf
    if (a:forward == 1)
        bn!
    else
        bp!
    endif
    let l:curBuf = bufnr('%')
  endwhile

  let g:miniBufExplorerAutoUpdate = l:saveAutoUpdate
  if (l:saveAutoUpdate == 1)
    call <SID>AutoUpdate(-1)
  endif

endfunction

" }}}e following hack handles the case where we only have one
  " window open and it is too small
  let l:saveAutoUpdate = g:miniBufExplorerAutoUpdate
  if (winbufnr(2) == -1)
    resize
    let g:miniBufExplorerAutoUpdate = 0
  endif

  " Skip any non-modifiable buffers, but don't cycle forever
  " This should stop us from stopping in any of the [Explorers]
  while getbufvar(l:curBuf, '&modifiable') == 0 && l:origBuf != l:curBuf
    if (a:forward == 1)
        bn!
    else
        bp!
    endif
    let l:curBuf = bufnr('%')
  endwhile

  let g:miniBufExplorerAutoUpdate = l:saveAutoUpdate
  if (l:saveAutoUpdate == 1)
    call <SID>AutoUpdate(-1)
  endif

endfunction


" == tab navigation settings ===================================
noremap <C-TAB>   :call <SID>CycleBuffer(1)<CR>:<BS>
noremap <C-S-TAB> :call <SID>CycleBuffer(0)<CR>:<BS>
noremap <C-t>     :tabnew<CR>

" == NERDTree settings =========================================
let g:NERDTreeShowHidden = 1
autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
nmap <silent> <C-D> :NERDTreeToggle<CR>

" == vim-airline settings ======================================
let g:airline#extensions#tabline#enabled = 1

