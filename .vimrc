"" Global settings
set encoding=utf-8
syntax on
filetype on
filetype plugin on
filetype indent on
set autowrite
set directory=~/.vim/swap
set wildchar=<tab> wildmenu wildmode=full " buffer list with <tab>
set omnifunc=ale#completion#OmniFunc
set belloff=all


"" Vim-plug
" Install
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin('~/.vim/plugged')
"Plug 'bakpakin/fennel.vim', { 'for': 'fennel' }
"Plug 'chr4/nginx.vim'
"Plug 'ekalinin/Dockerfile.vim', { 'for': 'Docker' }
"Plug 'glench/vim-jinja2-syntax', { 'for': 'jinja' }
"Plug 'godlygeek/tabular'
"Plug 'lifepillar/vim-solarized8'
"Plug 'plasticboy/vim-markdown'
"Plug 'romainl/flattened'
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggleVCS' }
"Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
"Plug 'jmcantrell/vim-virtualenv'
Plug '/usr/local/opt/fzf' " fzf searching
Plug 'Joorem/vim-haproxy', { 'for': 'haproxy' } " haproxy syntax
Plug 'airblade/vim-gitgutter' " git status in gutter
Plug 'bling/vim-airline' " status line
Plug 'ctrlpvim/ctrlp.vim' " file/buffer search
Plug 'drmingdrmer/vim-toggle-quickfix' " toggle for open/closing quickfix window
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' } " Go language
Plug 'guns/vim-sexp', { 'for': 'fennel' } " s-expression movements
Plug 'jpalardy/vim-slime' " REPL terminal
Plug 'junegunn/fzf.vim' " fzf searching
Plug 'junegunn/fzf' " fzf searching
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' } " distraction-free window view
Plug 'kien/rainbow_parentheses.vim', { 'for': 'fennel' } " s-expression readable syntax hilights ()
Plug 'ludovicchabant/vim-gutentags' " tag file management
Plug 'Lokaltog/vim-monotone' " color scheme
Plug 'mileszs/ack.vim', { 'on': 'Ack' }  " ack search
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' } " YAML syntax folds
Plug 'plan9-for-vimspace/acme-colors' " color scheme
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' } " tag sidebar
Plug 'qpkorr/vim-bufkill' " close buffer but keep window
Plug 'rizzatti/dash.vim' " Dash documentation search
Plug 'robertmeta/nofrils' " color scheme
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'sheerun/vim-polyglot' " syntax files for languages
Plug 'tpope/vim-commentary' " comment management
Plug 'tpope/vim-dispatch' " async command runner for Make/compile
Plug 'tpope/vim-endwise' " automatic structure closing for if, else, do, for, etc
Plug 'tpope/vim-eunuch' " UNIX file commands (Move, Rename, etc)
Plug 'tpope/vim-fireplace', { 'for': 'fennel' } " Lisp REPL
Plug 'tpope/vim-fugitive' " git interface
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'fennel' } " s-expression mapings
Plug 'tpope/vim-surround' " movements for text inside {[(\" etc
Plug 'tpope/vim-unimpaired' " pairs of handy bracket bindings
Plug 'tpope/vim-vinegar' " netrw wrapper
Plug 'w0rp/ale' " linting and autocompletion
Plug 'wfxr/minimap.vim', { 'on': 'MinimapToggle' } " sidebar file map
Plug 'xolox/vim-misc' " xolox support lib
Plug 'xolox/vim-session' " session management
call plug#end()


"" Formatting
set autoindent
set breakindent " Every wrapped line will continue visually indented
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=2 " tab spaces size
set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=2 " number of spaces to use for autoindenting
set smoothscroll


"" Display
autocmd VimResized * wincmd = " Auto-equalize window splits
colorscheme monotone " Color scheme
" Use italic terminal fonts for comments
highlight Comment cterm=italic
set foldlevel=6 " Default fold level
set foldmethod=syntax " Default to syntax folding
set hidden " keep buffers hidden
set history=1000
set hlsearch " Highlight search results
set ignorecase " Case-insensitive search
set incsearch " Incremental search
set laststatus=2 " Always show status line
set linebreak " ragged margins
set matchpairs+=<:> " show matching <>
set number " Show line numbers
set ruler " Show current position
set scrolloff=2 " keep three lines between the cursor and the bottom of the screen
set showcmd
set showmode
set smartcase
set title " Set terminal window title to filename
" GUI options
if has('gui_running')
 set guifont=Iosevka:h13
 set guicursor+=a:blinkon0
 set guioptions-=l
 set guioptions-=r
endif


"" Keybindings and aliases
" Tabs
nmap th :tabprev<CR>
nmap tl :tabnext<CR>
nmap tn :tabnew<CR>
nmap tc :tabclose<CR>
" Buffers
noremap K :bn<CR>
noremap J :bp<CR>
" diff open windows
command DA :windo diffthis
command Da :diffoff!
" git shortcuts
command Gblame :G blame
command Gc :G commit -v
command Gp :G push
command Gpf :G push -f
" ALE info window for symbold under cursor
nmap <Leader>K :ALEHover<CR>
" CtrlP
nmap <Leader>; :CtrlPMRUFiles<CR>
nmap <Leader>: :CtrlPBuffer<CR>
" fzf
nmap <Leader>f :Files<CR>
"nmap <Leader>g :Tags<CR>
nmap <Leader>a :Ag<CR>
""" Leader keys
" toggle window scroll binding
nmap <leader>b :windo set scrollbind!<CR>
" clear search highlight
nmap <leader>c :let @/ = ""<CR>
" vim-dash lookup under cursor
nmap <leader>D <Plug>DashSearch
" close vim-fugitive status window (only works from status window)
nmap <leader>g gq<CR>
" ALE
nmap <leader>gd :ALEGoToDefinition<CR>
nmap <leader>gi :ALEGoToImplementation<CR>
nmap <leader>gt :ALEGoToTypeDefinition<CR>
nmap <leader>gf :ALEFindReferences -quickfix<CR>
nmap <leader>gr :ALERename<CR>
nmap <leader>gj :ALENext -wrap<cr>
nmap <leader>gk :ALEPrevious -wrap<cr>
" git status
nmap <leader>G :G<CR>
nmap <leader>Gl :Commits<CR>
" start :help command
nmap <leader>h :help 
" close help window
nmap <leader>hc :helpclose<CR>
" toggle invisible chars
nmap <leader>i :set list!<cr>
" Ack search for word
nmap <leader>k :Ack! "\b<cword>\b" <CR>
" buffer list
nmap <leader>l :ls<cr>
" minimap-vim
map <leader>m :MinimapToggle<CR>
" file browser
nmap <leader>n :Lexplore<cr>
nmap <leader>nn :Lexplore %:p:h<CR>
" goyo
nmap <Leader>p :Goyo<CR>
" vim-session
map <leader>s :SaveSession<CR>
" show tags window
nmap <leader>t :TagbarToggle<CR>
" terminal
map <leader>T :terminal ++rows=15 ++close /bin/bash -l<CR>
" toggle line numbers
nmap <leader>u :set nu!<CR>
" edit $MYVIMRC
nmap <leader>v :tabnew $MYVIMRC<CR>
" buffkill: delete buffer, keep window
nmap <leader>w :BD<CR>
" close quickfix window
nmap <leader>x <Plug>window:quickfix:loop
" close preview window
nmap <leader>z :pclose<CR>
" Use Tab and Shift-tab to select completions
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-TAB>"


"" Filetype settings
" Python
augroup python
  au!
  au! BufNewFile,BufRead *.py  setlocal cc=100 tabstop=4 softtabstop=4 shiftwidth=4 expandtab
  au BufNewFile,BufRead *.py  setlocal foldmethod=indent
  au BufNewFile,BufRead *.py  let b:slime_vimterminal_cmd="ipython"
augroup end

" bash
augroup bash
  au!
  au! BufNewFile,BufRead *.profile set ft=bash
  au BufNewFile,BufRead *.sh  setlocal cc=100
  au BufNewFile,BufRead *.sh let b:slime_vimterminal_cmd = "/bin/bash -l"
augroup end

" lua
augroup lua
  au!
  au! BufNewFile,BufRead *.lua let b:slime_vimterminal_cmd = "/bin/bash -l"
  au BufNewFile,BufRead *.lua  setlocal cc=100
augroup end

" SQL
augroup sql
  au!
  au! BufNewFile,BufRead *.sql let b:slime_vimterminal_cmd = "/usr/local/bin/psql"
augroup end

" Go
augroup go
  au!
  au! BufNewFile,BufRead *.go let b:slime_vimterminal_cmd = "/usr/local/bin/go"
  au BufNewFile,BufRead *.go let foldcolumn = 3
augroup end

" Nginx configuration template
augroup nginx_template
  au!
  au! BufNewFile,BufRead *nginx.conf.template set ft=nginx
augroup end

" Nginx configuration template
augroup haproxy_template
  au!
  au! BufNewFile,BufRead *haproxy.cfg.template set ft=haproxy
augroup end

" Terraform
augroup terraform
  au!
  au! BufNewFile,BufRead *.tfvars set ft=tfvars
augroup end

" YAML Template
augroup yaml_template
  au!
  au! BufNewFile,BufRead *.yaml.tmpl set ft=yaml
  au! BufNewFile,BufRead *.yml.tmpl set ft=yaml
augroup end

" " Minimap
" augroup minimap
"   au!
"   au WinEnter * MinimapRefresh
" augroup end

" vimrc
augroup vimrc
  au!
  au! BufWritePost ~/.vimrc source ~/.vimrc
augroup end


"" Plugin settings
" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#format = 2
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#hunks#non_zero_only = 1

" tagbar settings
let g:tagbar_compact = 1
let g:tagbar_foldlevel = 1
let g:tagbar_position = 'leftabove vertical'
let g:tagbar_zoomwidth = 0
let tlist_sh_settings = 'sh;f:functions;v:variables;c:constants'
" I found adding shell variables to the tagbar too chatty
" let g:tagbar_type_sh = {
"   \ 'kinds':[
"   \ 'c:constants',
"   \ 'f:functions',
"   \ 'l:local',
"   \ 'v:variables'
"   \ ]
"   \}
let g:tagbar_type_terraform = {
\   'ctags_type':'Terraform',
\   'kinds':[
\   'd:data',
\   'm:module',
\   'o:output',
\   'p:provider',
\   'r:resource',
\   'v:variable'
\ ]
\}

" fugitive settings
autocmd QuickFixCmdPost *grep* cwindow " Open quickfix window for grep search results

" ack.vim settings
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ALE settings
let g:ale_completion_enabled = 1
let g:ale_default_navigation = 'split'
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'bash': ['shfmt'],
\   'lua': ['lua-format'],
\   'sh': ['shfmt'],
\   'terraform': ['terraform'],
\   'tfvars': ['terraform'],
\   'python': ['yapf', 'isort', 'autoimport',  'pyflyby' ],
\}
let g:ale_hover_to_preview = 1
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters = {
\   'bash': ['shellcheck'],
\   'dockerfile': ['hadolint'],
\   'javascript': ['eslint'],
\   'lua': ['luac', 'luacheck', 'lua_language_server'],
\   'python': ['pyright', 'pylint'],
\   'sh': ['shellcheck'],
\   'terraform': ['terraform', 'tflint', 'terraform_ls'],
\   'tfvars': ['terraform', 'tflint','terraform_ls' ],
\}
let g:ale_linters_ignore = {
\   'vim' : ['vim-language-server'],
\}
let g:ale_sign_column_always = 1
"" ALE Python
let g:ale_python_auto_virtualenv = 1
let g:ale_python_flake8_options = '--ignore=E501,W503'
let g:ale_python_pylint_options = '--disable=line-too-long --disable=missing-class-docstring --disable=missing-function-docstring --disable=missing-module-docstring --disable=too-many-public-methods --disable=too-few-public-methods --disable=broad-except --disable=too-many-arguments --disable=too-many-positional-arguments --disable=too-many-locals --disable=broad-exception-raised --disable=unspecified-encoding'
let g:ale_python_pylsp_executable = 'pyls'
"" ALE yamllint
let g:ale_yaml_yamllint_options = '-d relaxed'
"" ALE luacheck
let g:ale_lua_luacheck_options = '--std ngx_lua'
"" ALE shfmt
let g:ale_sh_shfmt_options = '-i 4 %'
"" ALE tflint
"" TODO ALE tflint definition is out of date, does not
""   match tflint >=0.49.0 JSON fields or CLI options (--chdir).
""   See file:
""   https://github.com/dense-analysis/ale/blob/master/ale_linters/terraform/tflint.vim
" let g:ale_terraform_tflint_options = '-f json --module --chdir '.expand('%:p:h')

" vim-dash settings
" open -g dash://'keys=vim&query=sys.exit'
let g:dash_map = {
\   'python' : 'boto3'
\ }

" vim-go settings
let g:go_doc_keywordprg_enabled = 0
let g:go_debug_mappings = {
\   '(go-debug-continue)':   {'key': '<F5>'},
\   '(go-debug-print)':      {'key': '<F6>'},
\   '(go-debug-breakpoint)': {'key': '<F9>'},
\   '(go-debug-next)':       {'key': '<F10>'},
\   '(go-debug-step)':       {'key': '<F11>'},
\   '(go-debug-halt)':       {'key': '<F8>'},
\ }

" vim-gutentag settings
let gutentags_cache_dir = '~/.vim/cache/vim-gutentags'

" vim-slime
if has('gui_running')
 let g:slime_target = 'vimterminal'
else
 let g:slime_target = 'tmux'
endif
let g:slime_default_config = { 'socket_name': 'default', 'target_pane': '{last}' }
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
let g:slime_vimterminal_config = { 'vertical': 1 }

" vim-session
let g:session_autoload = 'no'
let g:session_autosave = 'no'

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
\  'dir': 'node_modules',
\ }

" mimimap-vim
let g:minimap_highlight_range = 1

" Netrw
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = -31
let g:netrw_wiw = 31
function! NetrwMapping()
  nmap <buffer> . gh
  nmap <buffer> P <C-w>z
endfunction
augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END

" vim-dash
let g:dash_activate = 1
