"" Global settings
syntax	on
filetype on
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
"set foldmethod=indent
"set	foldlevel=5
set	autoindent
"set	expandtab " expand tabs by default (overloadable per file type later)
set	smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set	tabstop=2 " tab spaces size
set	softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set	shiftwidth=2 " number of spaces to use for autoindenting

"" Display
set	incsearch " Incremental search
set ignorecase " Case-insensitive search
set hlsearch " Highlight search results
set	showcmd
set	showmode
set smartcase
set ruler " Show current position
set	nu " Show line numbers
set history=1000
set scrolloff=3 " keep three lines between the cursor and the edge of the screen
set	title
set	hidden
set	linebreak
set matchpairs+=<:> " show matching <>

"" Keybindings
nmap th :tabprev<cr>
nmap tl :tabnext<cr>
nmap tn :tabnew<cr>
nmap tc :tabclose<cr>
nmap te :tabedit 

nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>vimrc :tabedit $MYVIMRC<CR> " Press ``,vimrc`` to edit vimrc file

set wildchar=<Tab> wildmenu wildmode=full " Buffer list with <Tab>
"" Misc
" Markdown also starts with .md
autocmd BufNewFile,BufRead *.md set filetype=markdown

" Save and run python when typing <leader>r
"noremap <buffer> <leader>r :w<cr> :exec '!python' shellescape(@%, 1)<cr>
