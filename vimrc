"" Global settings
set encoding=utf-8
syntax	on
filetype	on
filetype plugin on
filetype indent on
set	nocompatible " We're not using Vi

"" Use light or dark Solarized theme conditionally
colorscheme	solarized
if has('gui_running')
	set background=light
else
	set background=dark
endif

"" Formatting
set	autoindent
set breakindent " Every wrapped line will continue visually indented
"set	expandtab " expand tabs by default (overloadable per file type later)
set	smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set	tabstop=2 " tab spaces size
set	softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set	shiftwidth=2 " number of spaces to use for autoindenting

"" Display
set	incsearch " Incremental search
set	ignorecase " Case-insensitive search
set	hlsearch " Highlight search results
set	showcmd
set	showmode
set	smartcase
set	ruler " Show current position
set	nu " Show line numbers
set	history=1000
set	scrolloff=5 " keep three lines between the cursor and the bottom of the screen
set	title " Set terminal window title to filename
set	hidden
set	linebreak
set	matchpairs+=<:> " show matching <>
set	laststatus=2 " Always show status line
autocmd VimResized * wincmd = " Auto-equalize window splits

"" Keybindings
nmap th :tabprev<cr>
nmap tl :tabnext<cr>
nmap tn :tabnew<cr>
nmap tc :tabclose<cr>
nmap te :tabedit
noremap J :bn<cr>
noremap K :bp<cr>

" file browser
nmap <leader>n :NERDTreeToggle<cr>
" edit $MYVIMRC
nmap <leader>v :tabedit $MYVIMRC<cr>
" buffer list
nmap <leader>l :ls<cr>
" show tags window
nmap <leader>t :tagbartoggle<cr>
" toggle line numbers
nmap <leader>u :set nu!<cr>
" toggle invisible chars
nmap <leader>i :set list!<cr>
" toggle window scroll binding
nmap <leader>b :windo set scrollbind!<cr>

set	wildchar=<tab> wildmenu wildmode=full " buffer list with <tab>

"" misc
" markdown also starts with .md
autocmd bufnewfile,bufread *.md set filetype=markdown
" .j2 is jinja2
autocmd bufnewfile,bufread *.j2 set syntax=jinja

"" plugins
" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#format = 2

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
