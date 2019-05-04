set nocompatible
filetype off

set rtp+=$HOME/.config/nvim/bundle/Vundle.vim
call vundle#begin('$HOME/.config/nvim/bundle')

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'

" Colors
Plugin 'chriskempson/base16-vim'

" Autocomplete
Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

"
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'

" Languages
Plugin 'rust-lang/rust.vim'
Plugin 'racer-rust/vim-racer'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'
Plugin 'ledger/vim-ledger'
Plugin 'slim-template/vim-slim'
Plugin 'fatih/vim-go'
Plugin 'wavded/vim-stylus'
Plugin 'digitaltoad/vim-jade'
Plugin 'Glench/Vim-Jinja2-Syntax'

" Productivity
Plugin 'farseer90718/vim-taskwarrior'

Plugin 'majutsushi/tagbar'

" Plugin 'L9'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'vim-scripts/tlib'

" Snippets
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'honza/vim-snippets'

" Appearance
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'mattn/calendar-vim'
Plugin 'vim-scripts/vimwiki'
" Plugin 'mhinz/vim-startify'
" Plugin 'ngmy/vim-rubocop'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-endwise'
Plugin 'rstacruz/vim-closer'

Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'

" Linters and syntax stuff
Plugin 'w0rp/ale'
"
" Plugin 'neomake/neomake'
" Plugin 'vim-syntastic/syntastic'
" Plugin 'syngan/vim-vimlint'
" Plugin 'ynkdir/vim-vimlparser'
" Plugin 'tpope/vim-dispatch'
" Plugin 'whatyouhide/vim-gotham'
" Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'szw/vim-maximizer'
Plugin 'kassio/neoterm'

call vundle#end()

" Colorscheme
set t_Co=256
set termguicolors
set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard

" NERD Commenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 0

" NERDtree-tabs
let g:nerdtree_tabs_open_on_gui_startup = 0
let g:nerdtree_tabs_autoclose = 0

" Snipmate
" imap <S-Enter> <Plug>snipMateNextOrTrigger
" let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing

" YouCompleteMe
" let g:ycm_key_list_select_completion = ['<TAB>']
" let g:ycm_key_list_previous_completion = ['<S-TAB>']

" Neocomplete
let g:acp_enableAtStartup = 0
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#max_list = 10
let g:deoplete#sources#syntax#min_keyword_length = 3
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Deoplete with multiple cursors
function Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ledger setlocal sw=4 ts=4 sts=4
autocmd FileType rust setlocal sw=4 ts=4 sts=4

" Neocomplete snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
" Note: It must be "imap" and "smap".  It uses <Plug> mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/bundle/vim-snippets/snippets'

" Neomake
" Run NeoMake on read and write operations
" autocmd! BufReadPost,BufWritePost * Neomake
" autocmd! BufWritePost * Neomake
" autocmd BufUnload,BufWinLeave * lclose

" ALE
" let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_list_window_size = 3
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_open_list = 1

" let g:ale_sign_error = 'E>'
" let g:ale_sign_warning = 'W>'
let g:ale_sign_error = '×'
let g:ale_sign_warning = '•'

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'

" let g:neomake_ruby_enabled_makers = ['rubocop', 'reek']
" let g:neomake_open_list = 2
" let g:neomake_list_height = 4
" let g:neomake_serialize = 1
" let g:neomake_serialize_abort_on_error = 1
"
" let g:neomake_error_sign = {
"   \ 'text': 'E>',
"   \ 'texthl': 'NeomakeErrorSign',
"   \ }
" let g:neomake_warning_sign = {
"   \ 'text': 'S>',
"   \ 'texthl': 'NeomakeWarningSign',
"   \ }
" let g:neomake_info_sign = {
"   \ 'text': 'I>',
"   \ 'texthl': 'NeomakeInfoSign',
"   \ }
" let g:neomake_message_sign = {
"   \ 'text': 'M>',
"   \ 'texthl': 'NeomakeMsg',
"   \ }
"
" augroup my_neomake_signs
"   au!
"   autocmd ColorScheme *
"     \ hi NeomakeErrorSign ctermfg=red |
"     \ hi NeomakeWarningSign ctermfg=yellow
" augroup END

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" Syntastic
" let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_shell = "/bin/sh"
" let g:syntastic_loc_list_height = 3
"let g:syntastic_enable_balloons = 1
"let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_ruby_rubocop_exec ='/home/kressh/.rbenv/versions/2.2.0/bin/rubocop'
" let g:syntastic_ruby_rubocop_args = '-l'
" let g:syntastic_quiet_messages = { "type": "style" }
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 1

" Ack
" let g:ack_use_dispatch = 0
" Ag
if executable('rg')
  let g:ackprg = 'rg --vimgrep'
  cnoreabbrev ag Ack
  cnoreabbrev aG Ack
  cnoreabbrev Ag Ack
  cnoreabbrev AG Ack
endif

syntax enable
filetype plugin indent on

silent! nmap <C-p> :NERDTreeTabsToggle<CR>
silent! map <F4> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F4>"
let g:NERDTreeMapPreview="<F3>"

let g:calendar_keys = {'goto_next_month': '<C-Right>',
      \ 'goto_prev_month': '<C-Left>',
      \ 'goto_prev_year': '<C-Down>',
      \ 'goto_next_year': '<C-Up>'}
let g:calendar_monday = 1
let g:calendar_focus_today = 1

" RustFmt rust
let g:rustfmt_autosave = 1

" Racer
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

au BufRead,BufNewFile *.jbuilder setf ruby
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.arb setf ruby
au BufRead,BufNewFile *.axlsx setf ruby
au BufRead,BufNewFile *.tag setf coffee " riotjs tags

" silent! nmap <C-f> :FufLine<CR>
" silent! nmap <C-g> :FufCoverageFile<CR>
"
" Airline
let g:airline_theme      = 'base16'
" let g:airline_section_s  = ''  " Don't display encoding
" let g:airline_section_y  = ''  " Don't display encoding
let g:airline_powerline_fonts = 1
" let g:airline_left_sep   = '▶' " Set custom left separator
" let g:airline_right_sep  = '◀' " Set custom right separator
let g:airline#extensions#tabline#enabled      = 1 " Enable airline for tab-bar
" let g:airline#extensions#tabline#show_buffers = 0 " Don't display buffers in tab-bar with single tab
" let g:airline#extensions#tabline#fnamemod     = ':t'  " Display only filename in tab

" Buffer/Tab navigation
nnoremap <C-b>h :bp<CR>
nnoremap <C-b>n :bn<CR>
nnoremap <C-b>l :bn<CR>
nnoremap <C-b>d :bd<CR>

" Terminal
tnoremap <Esc> <C-\><C-n>
command Term split term://$SHELL
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'rightbelow'

" Vim gitgutter
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_removed_first_line = '█'
let g:gitgutter_sign_modified_removed = '█'

let g:ctrlp_map = '<c-g>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = "fd --type file --full-path -c never -H -E node_modules -E vendor -E public -E tmp -E log -E .git -E .hg -E .svn -E '*.min.js' -E '*.log' -E '.keep' %s"
let g:ctrlp_dont_split = 'NERD'
let g:ctrlp_root_markers = ['Dockerfile', 'gems.locked', 'Gemfile.lock', '.gitignore']
let g:ctrlp_working_path_mode = 'aw'
let g:ctrlp_use_caching = 0

" Vim maximizer
let g:maximizer_default_mapping_key = '<F3>'

" Replace current word with yanked or deleted text
nnoremap S "_diwP

fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

" tagbar
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_rust = {
  \ 'ctagstype' : 'rust',
  \ 'kinds' : [
     \'T:types,type definitions',
     \'f:functions,function definitions',
     \'g:enum,enumeration names',
     \'s:structure names',
     \'m:modules,module names',
     \'c:consts,static constants',
     \'t:traits',
     \'i:impls,trait implementations',
  \]
\}
let g:tagbar_type_ruby = {
  \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
  \ ]
\}

" Automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

" vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

set noswapfile

set ofu=syntaxcomplete#Complete
set ts=2           " Tabs are 2 spaces
set bs=2           " Backspace over everything in insert mode
set shiftwidth=2   " Tabs under smart indent

set cf                 " Enable error files & error jumping.
set clipboard=unnamed  " Yanks go on clipboard instead.
set history=32         " Number of things to remember in history.
set autowrite          " Writes on make/shell commands
set nu                 " Line numbers on

" set nowrap             " Line wrapping off
set wrap
set linebreak
set notimeout
set ttimeout
" set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)
set synmaxcol=200

set incsearch
set hlsearch   " Highlight searches
set ruler              " Ruler on

set re=1
" set ttyfast
" set lazyredraw

set nocp incsearch
" Search
" set ignorecase " Ignore case of searches

set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case,begin
set formatoptions=tcqr
set cindent
set autoindent
set smarttab
set expandtab

set colorcolumn=80,120
" hi ColorColumn guibg=Black

set nostartofline                " Don’t reset cursor to start of line when moving around.
set noeol                        " Don’t add empty newlines at the end of files
autocmd InsertEnter * set cul    " Show cursor line in insert mode
autocmd InsertLeave * set nocul  " Hide cursor line in insert mode

" Visual
set showmatch    " Show matching brackets.
set mat=5        " Bracket blinking.
                 " Show $ at end of line and trailing space as ~
set novisualbell " No blinking .
set noerrorbells " No noise.
set laststatus=2 " Always show status line.

" Invisibles
" set listchars=tab:▸\ ,eol:¬
set list listchars=tab:▸·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" inoremap  <Up>     <NOP>
" inoremap  <Down>   <NOP>
" inoremap  <Left>   <NOP>
" inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
