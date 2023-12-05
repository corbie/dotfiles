"" Global settings
set encoding=utf-8
syntax on
filetype on
filetype plugin on
filetype indent on
set nocompatible
set autowrite
set dir=~/.vim/swap
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
Plug '/usr/local/opt/fzf'
Plug 'Joorem/vim-haproxy', { 'for': 'haproxy' }
Plug 'Lokaltog/vim-monotone'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --go-completer' }
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'drmingdrmer/vim-toggle-quickfix'
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go' }
Plug 'guns/vim-sexp', { 'for': 'fennel' }
Plug 'jpalardy/vim-slime'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim', { 'on': 'Goyo' }
Plug 'kien/rainbow_parentheses.vim'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mileszs/ack.vim', { 'on': 'Ack' }
Plug 'pedrohdz/vim-yaml-folds', { 'for': 'yaml' }
Plug 'plan9-for-vimspace/acme-colors'
Plug 'preservim/tagbar', { 'on': 'TagbarToggle' }
Plug 'qpkorr/vim-bufkill'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fireplace', { 'for': 'fennel' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'fennel' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'w0rp/ale'
Plug 'wfxr/minimap.vim', { 'on': 'MinimapToggle' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'
call plug#end()


"" Formatting
set autoindent
set breakindent " Every wrapped line will continue visually indented
set smarttab " insert tabs on the start of a line according to shiftwidth, not tabstop
set tabstop=2 " tab spaces size
set softtabstop=2 " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=2 " number of spaces to use for autoindenting


"" Display
autocmd VimResized * wincmd = " Auto-equalize window splits
colorscheme monotone " Color scheme
" Use italic terminal fonts for comments
highlight Comment cterm=italic
set foldlevel=3 " Default fold level
set foldmethod=syntax " Default to syntax folding
set hidden " keep buffers hidden
set history=1000
set hlsearch " Highlight search results
set ignorecase " Case-insensitive search
set incsearch " Incremental search
set laststatus=2 " Always show status line
set linebreak " ragged margins
set matchpairs+=<:> " show matching <>
set nu " Show line numbers
set ruler " Show current position
set scrolloff=5 " keep three lines between the cursor and the bottom of the screen
set showcmd
set showmode
set smartcase
set title " Set terminal window title to filename
" GUI options
if has('gui_running')
 set guifont=Iosevka:h14
 set guicursor+=a:blinkon0
 set guioptions-=lr " Disable left and right GUI scrollbars
endif


"" Keybindings and aliases
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
nmap <leader>n :Lexplore<cr>
nmap <leader>nn :Lexplore %:p:h<cr>
" edit $MYVIMRC
nmap <leader>v :vsplit $MYVIMRC<cr>
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
nmap <leader>x <Plug>window:quickfix:loop
" clear search highlight
map <leader>c :let @/ = ""<CR>
" Ack search for word
nmap <leader>k :Ack! "\b<cword>\b" <CR>
" CtrlP
nmap <Leader>; :CtrlPBuffer<CR>
nmap <Leader>: :CtrlPBufTag<CR>
" fzf
nmap <Leader>f :Files<CR>
nmap <Leader>g :Tags<CR>
nmap <Leader>a :Ag<CR>
" goyo
nmap <Leader>p :Goyo<CR>
" buffkill: delete buffer, keep window
nmap <leader>w :BD<CR>
" git status
nmap <leader>G :G<CR>
nmap <leader>g gq<CR>
nmap <leader>Gl :Commits<CR>
" git shortcuts
command Gc :G commit -v
command Gp :G push
" Github
nmap <leader>Ghr :!gh run view<CR>
nmap <leader>Gpr :!gh pr create<CR>
" YouCompleteMe
map <leader>d  :YcmCompleter GoToDefinitionElseDeclaration<CR>
map <leader>o  :YcmCompleter GetDoc<CR>
" vim-session
map <leader>s :SaveSession<CR>
" minimap-vim
map <leader>m :MinimapToggle<CR>
" terminal
map <leader>T :vertical terminal /bin/bash -l<CR>


"" Filetype settings
" Python
augroup python
  au!
  au BufNewFile,BufRead *.py setlocal cc=80 tabstop=4 softtabstop=4 shiftwidth=4 textwidth=0 expandtab
  au BufNewFile,BufRead *.py let g:slime_vimterminal_cmd="/usr/local/bin/ipython"
  au! BufNewFile,BufRead *.py set ft=python
augroup end

" bash
augroup bash
  au!
  au! BufNewFile,BufRead *.sh let g:slime_vimterminal_cmd = "/bin/bash -l"
  au! BufNewFile,BufRead *.profile set ft=bash
augroup end

" lua
augroup lua
  au!
  au BufNewFile,BufRead *.lua let g:slime_vimterminal_cmd = "/usr/local/bin/lua -i -W"
  au BufNewFile,BufRead *.go set ft=lua
augroup end

" SQL
au! BufNewFile,BufRead *.sql let g:slime_vimterminal_cmd = "/usr/local/bin/psql"

" Go
augroup go
  au!
  au BufNewFile,BufRead *.go let g:slime_vimterminal_cmd = "/usr/local/bin/go"
  au BufNewFile,BufRead *.go let foldcolumn = 3
  au BufNewFile,BufRead *.go set ft=go
augroup end

" Nginx configuration template
augroup nginx_template
  au!
  au BufNewFile,BufRead *nginx.conf.template set ft=nginx
augroup end

" Nginx configuration template
augroup haproxy_template
  au!
  au BufNewFile,BufRead *haproxy.cfg.template set ft=haproxy
augroup end

" Terraform
augroup terraform
  au!
  au BufNewFile,BufRead *.tf set ft=terraform
  au BufNewFile,BufRead *.tfvars set ft=tfvars
augroup end

" YAML Template
augroup yaml_template
  au!
  au BufNewFile,BufRead *.yaml.tmpl set ft=yaml
  au BufNewFile,BufRead *.yml.tmpl set ft=yaml
augroup end

" Minimap
" augroup minimap
"   au!
"   au WinEnter * MinimapRefresh
" augroup end

" vimrc
au! BufWritePost ~/.vimrc source ~/.vimrc


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
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'bash': ['shfmt'],
\   'lua': ['lua-format'],
\   'sh': ['shfmt'],
\   'tf': ['terraform'],
\   'terraform': ['terraform'],
\   'python': ['yapf'],
\}
let g:ale_lint_delay = 1000
let g:ale_lint_on_text_changed = 'always'
let g:ale_linters = {
\   'bash': ['shellcheck'],
\   'dockerfile': ['hadolint'],
\   'javascript': ['eslint'],
\   'lua': ['luac', 'luacheck --std ngx_lua'],
\   'python': ['flake8', 'pyls', 'bandit', 'mypy'],
\   'ruby': ['standardrb', 'rubocop'],
\   'sh': ['shellcheck'],
\   'tf': ['tflint','terraform-ls' ],
\   'tfvars': ['tflint','terraform-ls' ],
\}
let g:ale_sign_column_always = 1
"" ALE Python
let g:ale_python_pyls_executable = "pylsp"
let g:ale_python_pyls_config = {
\   'pylsp': {
\     'plugins': {
\       'pycodestyle': {
\         'enabled': v:false,
\       },
\       'pyflakes': {
\         'enabled': v:false,
\       },
\       'pydocstyle': {
\         'enabled': v:false,
\       },
\     },
\   },
\}
"" ALE yamllint
let g:ale_yaml_yamllint_options = '-d relaxed'
"" ALE luacheck
let g:ale_lua_luacheck_options = '--std ngx_lua'

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

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_auto_hover=''
let g:ycm_language_server = [
\   { 'name': 'lua',
\     'filetypes': [ 'lua' ],
\     'cmdline': [ '/usr/local/Cellar/lua-language-server/3.2.2/bin/lua-language-server',
\                  '/usr/local/Cellar/lua-language-server/3.2.2/libexec/main.lua' ]
\   },
\ ]

" vim-slime
let g:slime_target = 'vimterminal'
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
