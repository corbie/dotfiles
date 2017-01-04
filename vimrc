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
"set	foldmethod=indent
"set	foldlevel=5
set	autoindent
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

"" Keybindings
nmap th :tabprev<cr>
nmap tl :tabnext<cr>
nmap tn :tabnew<cr>
nmap tc :tabclose<cr>
nmap te :tabedit

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>v :tabedit $MYVIMRC<CR>
nmap <leader>l :ls<CR>
nmap <leader>t :TagbarToggle<CR>

set	wildchar=<Tab> wildmenu wildmode=full " Buffer list with <Tab>

"" Misc
" Markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown
" .j2 is Jinja2
autocmd BufNewFile,BufRead *.j2 set syntax=jinja

"" Plugins
" Airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" Tagbar settings
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
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
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
