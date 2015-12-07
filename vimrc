"" Use special color scheme
colorscheme desert
set background=dark

"" Status Line 
set statusline=%<\ %n:%f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

"" Highlight the current line
set cursorline
set ruler
"set wildmenu
"set wildmode=longest,full

"" Line numbers
set number

"" Use 4 white space for <tab>
set tabstop=4

"" Replace the <tab>
"set expandtab

"" Setup C/C++ autoindent
set cindent
set autoindent
set shiftwidth=2
set mouse=a

"" Auto Text Wrapping
set tw=79
set formatoptions+=t


set nocompatible







"" Movement Setting 
nnoremap j gj
nnoremap k gk
noremap , 5h
noremap . 5l





"" Enable code folding
set foldenable
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


"" C++ template type .txx, .hpp & .cu support
filetype plugin indent on
syntax on
au BufNewFile,BufRead *.txx,*.hpp,*.cu set filetype=cpp
au BufNewFile,BufRead *.tex set spell
au BufNewFile,BufRead *.tex set nopaste




"" Pathogen
" call pathogen#infect()
" call pathogen#helptags()


"" TagList
nnoremap t :TlistToggle<CR>
let Tlist_Auto_Open=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1
let Tlist_Use_SingleClick=1
"let g:Tlist_Ctags_Cmd='/usr/local/Cellar/ctags/5.8_1/bin/ctags'


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
 

"" Backup
set backup
set backupdir=~/.vim-tmp,~/.tmp
set directory=~/.vim-tmp,~/.tmp
set writebackup
