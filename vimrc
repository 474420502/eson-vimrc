" Vim-plug initialization
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif
" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif
" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Plugins from github repos:
" Selection
Plug 'terryma/vim-expand-region'
" Override configs by directory
Plug 'arielrossanigo/dir-configs-override.vim'
" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
" Plug 'ctrlpvim/ctrlp.vim'
" " Extension to ctrlp, for fuzzy command finder
" Plug 'fisadev/vim-ctrlp-cmdpalette'
" Zen coding
Plug 'mattn/emmet-vim'
" Session
Plug 'thaerkh/vim-workspace'
" Git integration
Plug 'motemen/git-vim'
" Tab list panel
Plug 'kien/tabman.vim'
" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Terminal Vim with 256 colors colorscheme
Plug 'fisadev/fisa-vim-colorscheme'
" Consoles as buffers
Plug 'rosenfeld/conque-term'
" Pending tasks list
Plug 'fisadev/FixedTaskList.vim'
" Surround
Plug 'tpope/vim-surround'
" Autoclose
Plug 'jiangmiao/auto-pairs'
" Indent text object
Plug 'michaeljsmith/vim-indent-object'
" Indentation based movements
Plug 'jeetsukumaran/vim-indentwise'
" Python mode (indentation, doc, refactor, lints, code checking, motion and
" operators, highlighting, run and ipdb breakpoints)
" Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
" Better autocompletion
Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet.vim'
Plug '474420502/neosnippet-snippets'
" Snippets manager (SnipMate), dependencies, and snippets repo
Plug 'MarcWeber/vim-addon-mw-utils'
" Plug 'garbas/vim-snipmate'
" Git/mercurial/others diff icons on the side of the file lines
" Plug 'mhinz/vim-signify'
" Automatically sort python imports
Plug 'fisadev/vim-isort'
" Drag visual blocks arround
Plug 'fisadev/dragvisuals.vim'
" Window chooser
Plug 't9md/vim-choosewin'
" Python and other languages code checker
Plug 'scrooloose/syntastic'
" Paint css colors with the real color
Plug 'lilydjwg/colorizer'
" autocmd pep8 format
Plug 'mindriot101/vim-yapf'
"  format
Plug 'Chiel92/vim-autoformat'
" search 
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Relative numbering of lines (0 is the current line)
" (disabled by default because is very intrusive and can't be easily toggled
" on/off. When the plugin is present, will always activate the relative
" numbering every time you go to normal mode. Author refuses to add a setting
" to avoid that)

" Plug 'artur-shaik/vim-javacomplete2'

"  golang 
Plug 'fatih/vim-go'
" html js  
Plug 'tomtom/tlib_vim'

" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()
" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" Vim settings and mappings
" You can edit them as you wish
" coding 
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,gbk,latin1
" no vi-compatible
set nocompatible
" Set x = xall
cabbrev x xall
" allow plugins by file type (required for plugins!)
filetype plugin on
filetype indent on
" tabs and spaces handling
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

" tab length exceptions on some file types
autocmd FileType html setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType javascript setlocal shiftwidth=4 tabstop=4 softtabstop=4

" always show status bar
set ls=2
" incremental search
set incsearch
" highlighted search results
set hlsearch

" syntax highlight on
syntax on
" show line numbers
set nu
" autosession
let g:workspace_session_name = '.session.vim'
let g:workspace_autosave_always = 1
let g:workspace_autosave_untrailspaces = 0
let g:workspace_autosave_ignore = ['gitcommit', 'tagbar', 'nerdtree']
let g:workspace_persist_undo_history = 0
nmap ,s :ToggleWorkspace<CR>
" autoformat
" let g:autoformat_verbosemode=1
" let g:formatter_yapf_style = 'pep8'
" let g:formatdef_autopep8 = "'autopep8 - --range '.a:firstline.' '.a:lastline"
" let g:formatters_python = ['autopep8']
noremap <F8> :Autoformat<CR>
au FileType python noremap <F8> :Yapf<CR>

" neosnippet
imap <C-k> <Plug>(neosnippet_expand_or_jump)

" tab navigation mappings
map tn :tabn<CR>
map tp :tabp<CR>
map tm :tabm
map tt :tabnew
map ts :tab split<CR>
nmap `<Right> :tabn<CR>
imap `<Right> <ESC>:tabn<CR>
nmap `<Left> :tabp<CR>
imap `<Left> <ESC>:tabp<CR>
" buffers
inoremap `<Up> :bp<CR>
noremap  `<Up> <ESC>:bp<CR>
inoremap `<Down> :bn<CR>
noremap `<Down> <ESC>:bn<CR>
" navigate windows with meta+arrows
map <M-Right> <c-w>l
map <M-Left> <c-w>h
map <M-Up> <c-w>k
map <M-Down> <c-w>j
imap <M-Right> <ESC><c-w>l
imap <M-Left> <ESC><c-w>h
imap <M-Up> <ESC><c-w>k
imap <M-Down> <ESC><c-w>j
" old autocomplete keyboard shortcut
imap <C-J> <C-X><C-O>
" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
" set completeopt+=longest
set completeopt-=preview
" Save as sudo
ca w!! w !sudo tee "%"
" simple recursive grep

" use 256 colors when possible
if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
    let &t_Co = 256
    colorscheme fisa
else
    colorscheme delek
endif
" colors for gvim
if has('gui_running')
    colorscheme wombat
endif
" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3
" autocompletion of files and commands behaves like shell
" (complete only the common part, list the options that match)
set wildmode=list:longest
" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" Plugins settings and mappings
" Edit them as you wish.
" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
map <F9> :set paste<CR>
map <F10> :set nopaste<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1
" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" Tasklist ------------------------------

" show pending tasks list
map <F2> :TaskList<CR>

" fzf 
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
nnoremap <silent> <Leader>a :Ag <CR>
nnoremap <silent> <Leader>w :Ag! <cword><CR>
" Syntastic ------------------------------

" show list of errors and warnings on the current file
nmap <leader>e :Errors<CR>
" check also when just opened the file
let g:syntastic_check_on_open = 1
" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 0

let g:syntastic_python_checkers=["pep8"]
let g:syntastic_python_flake8_args="--ignore=E501,W601,E402"
let g:syntastic_python_pep8_args="--ignore=E501,W601,E402"

" Use neocomplete
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "\<CR>" )
endfunction
" AutoComplPop like behavior.
" Shell like behavior(not recommended).
let g:neocomplete#enable_auto_select = 0
" let g:neocomplete#disable_auto_complete = 1
let g:neosnippet#enable_snipmate_compatibility = 0
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=jedi#completions
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.python = '\%([^. \t]\.\|^\s*@\|^\s*from\s.\+import \|^\s*from \|^\s*import \)\w*'
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : <SID>check_back_space() ? "\<TAB>" : neocomplete#start_manual_complete() ? "\<TAB>" : "\<C-x>\<C-o>"
function! s:check_back_space() "{{{
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~ '\s'
endfunction "}}

" TabMan ------------------------------

" mappings to toggle display, and to focus on it
let g:tabman_toggle = 'tl'
let g:tabman_focus  = 'tf'

" Autoclose ------------------------------

" Fix to let ESC work as espected with Autoclose plugin
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" DragVisuals ------------------------------

" mappings to move blocks in 4 directions
vmap <expr> <S-M-LEFT> DVB_Drag('left')
vmap <expr> <S-M-RIGHT> DVB_Drag('right')
vmap <expr> <S-M-DOWN> DVB_Drag('down')
vmap <expr> <S-M-UP> DVB_Drag('up')
" mapping to duplicate block
vmap <expr> D DVB_Duplicate()

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Window Chooser ------------------------------

" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

" Airline ------------------------------
set laststatus=2
let g:airline_powerline_fonts = 0
let g:airline_theme = 'bubblegum'
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
" let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0


set backspace=indent,eol,start
if has("autocmd")
    au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")| exe "normal g'\"" | endif
endif

" au FileType go let g:mapleader = "`"
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test-func)
au FileType go nmap <leader>c <Plug>(go-coverage)

au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)

au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)

au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
" au FileType go nmap <Leader>e <Plug>(go-rename)

au FileType go let g:go_highlight_functions = 1
au FileType go let g:go_highlight_methods = 1
au FileType go let g:go_highlight_fields = 1
au FileType go let g:go_highlight_structs = 1
au FileType go let g:go_highlight_interfaces = 1
au FileType go let g:go_highlight_operators = 1
au FileType go let g:go_highlight_build_constraints = 1
au FileType go let g:go_highlight_extra_types = 1
au FileType go let g:go_snippet_case_type = "camelcase"
au FileType go let g:go_decls_includes = "func,type"
au FileType go let g:go_fmt_command = "gofmt"
au FileType go let g:go_fmt_fail_silently = 1
au FileType go let g:go_fmt_autosave = 1
au FileType go let g:go_def_mode = 'godef'
au FileType go let g:go_snippet_engine = "neosnippet"
au FileType go let g:go_term_enabled = 1
au FileType go let g:go_auto_type_info = 1
au FileType go let g:go_auto_sameids = 0
au FileType go nmap <F5> :GoImports<CR>
au FileType go let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
au FileType go let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
au FileType go let g:neocomplete#sources#omni#input_patterns.go = '[^.[:digit:] *\t]\.\w*\|^\s*import \"'
" au FileType go let g:go_list_type = "quickfix"

au FileType java nmap <F5> <Plug>(JavaComplete-Imports-AddSmart)
au FileType java nmap <F6> <Plug>(JavaComplete-Imports-Add)
au FileType java nmap <F7> <Plug>(JavaComplete-Imports-AddMissing)
au FileType java nmap <F8> <Plug>(JavaComplete-Imports-RemoveUnused)
