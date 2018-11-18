set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required
syntax on

"" Use special color scheme
colorscheme desert
set background=dark

"" Status Line 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"" Highlight the current line
set cursorline
set ruler

"" Line numbers
set number

set expandtab
set shiftwidth=3
set softtabstop=3
set tabstop=3
set smartindent
set autoindent
set copyindent
set expandtab

""" Use 4 white space for <tab>
"set tabstop=4
""" Replace the <tab>
"set expandtab
""" Setup C/C++ autoindent
"set cindent
"set autoindent
"set shiftwidth=2
"set mouse=a
"





"" Movement Setting 
nnoremap j gj
nnoremap k gk
noremap , 5h
noremap . 5l




"" Auto Text Wrapping
set tw=100
set formatoptions+=t

"" C++ template type .txx, .hpp & .cu support
au BufNewFile,BufRead *.txx,*.hpp,*.cu set filetype=cpp

"" Latex file type
au BufNewFile,BufRead *.tex *.bib set spell nopaste

"" Python and Cython type support
au BufNewFile,BufRead *.pyx set filetype=python
au BufNewFile,BufRead *.py,*.pyx setlocal tabstop=4 shiftwidth=4 noexpandtab

"" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp
set directory=~/.vim-tmp,~/.tmp
set writebackup

"" MRU - Most recently used
let MRU_Max_Entries = 2000
let MRU_File = "/home/chenhany/.vim/mru_files.txt"
function! s:Mru_Window_Toggle()
   let wnum = bufwinnr('__MRU_Files__')
   " Open or jump to the MRU window
   MRU
   if wnum != -1
      " MRU window was already open. Close it
      close
   endif
endfunction
"toggle mru window
nnoremap <silent> <c-f> :call <SID>Mru_Window_Toggle()<CR>



""" Enable code folding
"set foldenable
"set foldmethod=syntax
"set foldlevel=0
"set foldcolumn=8
"hi FoldColumn ctermfg=Yellow ctermbg=NONE 
"hi Folded ctermfg=Yellow ctermbg=NONE
"set foldtext=MyFoldText2()
"
"function MyFoldText2()
"  let nucolwidth = &fdc + &number*&numberwidth
"  let winwd = winwidth(0) - nucolwidth - 5
"  let foldlinecount = foldclosedend(v:foldstart) - foldclosed(v:foldstart) + 1
"  let prefix = " _______>>> "
"  let fdnfo = prefix . string(v:foldlevel) . "," . string(foldlinecount)
"  let line =  strpart(getline(v:foldstart), 0 , winwd - len(fdnfo))
"    \ . " ... " . strpart(getline(v:foldend), 0 , winwd - len(fdnfo)) 
"  let fillcharcount = winwd - len(line) - len(fdnfo)
"  return line . repeat(" ",fillcharcount) . fdnfo
"endfunction



""" TagList
"nnoremap t :TlistToggle<CR>
"let Tlist_Auto_Open=1
"let Tlist_Exit_OnlyWindow=1
"let Tlist_Use_Right_Window=1
"let Tlist_Use_SingleClick=1
""let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'





"" Pathogen
" call pathogen#infect()
" call pathogen#helptags()



"" Nerdtree
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
