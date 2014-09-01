set nocompatible
set nu
set tabstop=2
set shiftwidth=2
set expandtab
set backup
set mouse=a
set autowrite
" set columns=80

filetype on
set foldmethod=syntax
set foldlevel=0
set foldcolumn=8
hi FoldColumn ctermfg=Yellow ctermbg=NONE 
hi Folded ctermfg=Yellow ctermbg=NONE
set foldtext=MyFoldText2()
function MyFoldText2()
  let nucolwidth = &fdc + &number*&numberwidth
  let winwd = winwidth(0) - nucolwidth - 5
  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
  let prefix = " _______>>> "
  let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
    \ . " ... " . strpart(getline(v:foldend), 0 , winwd - len(fdnfo)) 
  let fillcharcount = winwd - len(line) - len(fdnfo)
  return line . repeat(" ",fillcharcount) . fdnfo
endfunction

let c_space_errors = 1
let c_no_comment_fold=1

noremap , 5h
noremap . 5l
nnoremap s :syntax sync fromstart<CR>

" C++ template type .txx & .cu support
syntax on
au BufNewFile,BufRead *.txx set filetype=cpp
au BufNewFile,BufRead *.cu set filetype=cpp


" Pathogen
" call pathogen#infect()
" call pathogen#helptags()

set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
filetype plugin indent on
 
" Nerdtree
" autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" let NERDTreeShowBookmarks=1
" let NERDTreeChDirMode=0
" let NERDTreeQuitOnOpen=0
" let NERDTreeMouseMode=2
" let NERDTreeShowHidden=1
" let NERDTreeIgnore=['\.pyc','\~$','\.swo$','\.swp$','\.git','\.hg','\.svn','\.bzr']
" let NERDTreeKeepTreeInNewTab=1
" let g:nerdtree_tabs_open_on_gui_startup=0
 

set background=dark
colorscheme desert
