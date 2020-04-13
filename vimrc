"" Global settings
set encoding=utf-8
syntax on
filetype on
filetype plugin on
filetype indent on
set nocompatible
set autowrite


"" Vim-plug
" Install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
Plug '/usr/local/opt/fzf'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'glench/vim-jinja2-syntax', { 'for': 'jinja' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'plan9-for-vimspace/acme-colors'
Plug 'qpkorr/vim-bufkill'
Plug 'romainl/flattened'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'w0rp/ale'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' }
Plug 'hashivim/vim-terraform'
call plug#end()


"" Formatting
set autoindent
set breakindent " Every wrapped line will continue visually indented
"set expandtab " expand tabs by default (overloadable per file type later)
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=2 " tab spaces size
set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=2 " number of spaces to use for autoindenting


"" Display
set incsearch " Incremental search
set ignorecase " Case-insensitive search
set hlsearch " Highlight search results
set showcmd
set showmode
set smartcase
set ruler " Show current position
set nu " Show line numbers
set history=1000
set scrolloff=5 " keep three lines between the cursor and the bottom of the screen
set title " Set terminal window title to filename
set hidden " keep buffers hidden
set linebreak " ragged margins
set matchpairs+=<:> " show matching <>
set laststatus=2 " Always show status line
set foldlevel=5 " Default fold level
set foldmethod=syntax " Default to syntax folding
set nofoldenable " Folding off by default
autocmd VimResized * wincmd = " Auto-equalize window splits
set guioptions-=lr " Disable left and right GUI scrollbars

" Use light or dark theme conditionally
"colorscheme flattened_light
colorscheme acme
" Set GUI font
if has('gui_running')
 set guifont=Iosevka\ SS08:h12
endif
" Use italic terminal fonts for comments
highlight Comment cterm=italic


"" Keybindings
" Tabs
nmap th :tabprev<cr>
nmap tl :tabnext<cr>
nmap tn :tabnew<cr>
nmap tc :tabclose<cr>
nmap te :tabedit
" Buffers
noremap K :bn<cr>
noremap J :bp<cr>
" file browser
nmap <leader>n :NERDTreeToggle<cr>
" edit $MYVIMRC
nmap <leader>v :tabedit $MYVIMRC<cr>
" buffer list
nmap <leader>l :ls<cr>
" show tags window
nmap <leader>t :TagbarToggle<cr>
" toggle line numbers
nmap <leader>u :set nu!<cr>
" toggle invisible chars
nmap <leader>i :set list!<cr>
" toggle window scroll binding
nmap <leader>b :windo set scrollbind!<cr>
" close quickfix window
nmap <leader>x :cclose <bar> lcl<cr>
" buffer list with <tab>
set wildchar=<tab> wildmenu wildmode=full
" Ack search for word
nmap <M-k> :Ack! "\b<cword>\b" <CR>
" CtrlP
nmap <Leader>; :CtrlPBuffer<CR>
" fzf
nmap <Leader>f :Files<CR>
nmap <Leader>g :Tags<CR>
nmap <Leader>a :Ag<CR>
" goyo
nmap <Leader>p :Goyo<CR>
" buffkill: delete buffer, keep window
nmap <M-w> :BD<CR>
" vim-go
nmap Gr :GoRun<cr>
nmap Gb :GoBuild<cr>
nmap Gd :GoDoc<cr>
" YouCompleteMe
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>


"" Plugin settings
" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#format = 2
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" tagbar settings
let g:tagbar_type_ansible = {
    \ 'ctagstype' : 'ansible',
    \ 'kinds' : [
        \ 't:tasks'
    \ ],
    \ 'sort' : 0
\ }
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:heading_l1',
        \ 'i:heading_l2',
        \ 'k:heading_l3'
    \ ]
\ }
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" fugitive settings
autocmd QuickFixCmdPost *grep* cwindow " Open quickfix window for grep search results

" ack.vim settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ALE settings
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'always'
let g:ale_sign_column_always = 1
let g:ale_yaml_yamllint_options = '-d relaxed'

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
