set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'gmarik/Vundle.vim'
" Plugin 'pydave/AsyncCommand'
Plugin 'tpope/vim-fugitive'

" Autocomplete
Plugin 'Shougo/deoplete.nvim'
" Plugin 'Valloric/YouCompleteMe'
" Plugin 'Shougo/unite.vim'
" Plugin 'ervandew/supertab'

"
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Lokaltog/vim-easymotion'

" Ruby/Rails
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-bundler'

" Productivity
Plugin 'farseer90718/vim-taskwarrior'

Plugin 'majutsushi/tagbar'

Plugin 'L9'
" Plugin 'FuzzyFinder'
" Plugin 'AutoComplPop'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'tpope/vim-rvm'
" Plugin 'vim-scripts/ScreenShot'
Plugin 'vim-scripts/SearchComplete'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'vim-scripts/tlib'

" Snippets
" Plugin 'garbas/vim-snipmate'
" Plugin 'honza/vim-snippets'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

Plugin 'vim-scripts/taglist.vim'

" Appearance
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Langs
Plugin 'kchmck/vim-coffee-script'
Plugin 'slim-template/vim-slim'
Plugin 'fatih/vim-go'
Plugin 'wavded/vim-stylus'
Plugin 'tpope/vim-haml'
Plugin 'digitaltoad/vim-jade'

" CVS
Plugin 'phleet/vim-mercenary'

Plugin 'mattn/calendar-vim'
Plugin 'vim-scripts/vimwiki'
" Plugin 'mhinz/vim-startify'
Plugin 'ngmy/vim-rubocop'
Plugin 'tpope/vim-surround'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'godlygeek/tabular'
Plugin 'nathanaelkane/vim-indent-guides'

Plugin 'scrooloose/syntastic'
" Plugin 'syngan/vim-vimlint'
" Plugin 'ynkdir/vim-vimlparser'
" Plugin 'tpope/vim-dispatch'
" Plugin 'whatyouhide/vim-gotham'
Plugin 'altercation/vim-colors-solarized'
Plugin 'airblade/vim-gitgutter'
Plugin 'szw/vim-maximizer'

call vundle#end()

let wiki = {}
let wiki.path = '~/wiki/'
let wiki.diary_rel_path='journal/'
let wiki.diary_index='journal'
let wiki.diary_header='Journal'
let wiki.syntax = 'markdown'
let wiki.ext = '.md'
"let wiki.auto_export = 1
let wiki.nested_syntaxes = {'ruby': 'ruby', 'sh': 'sh'}
"let wiki.custom_wiki2html = '~/scripts/vimwiki-md2html.rb'
let g:vimwiki_list = [wiki]
let g:vimwiki_hl_headers = 1
let g:vimwiki_hl_cb_checked = 1
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.mkd': 'markdown', '.wiki': 'media'}

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

autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete

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
  set conceallevel=2 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'

" Syntastic
" let g:syntastic_ruby_checkers = ['mri']
"let g:syntastic_shell = "/bin/sh"
"let g:syntastic_loc_list_height = 2
"let g:syntastic_enable_balloons = 1
"let g:syntastic_ruby_checkers = ['rubocop']
"let g:syntastic_ruby_rubocop_exec ='/home/kressh/.rbenv/versions/2.2.0/bin/rubocop'
" let g:syntastic_ruby_rubocop_args = '-l'
" let g:syntastic_quiet_messages = { "type": "style" }
"let g:syntastic_always_populate_loc_list = 0
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1

" Ack
let g:ack_use_dispatch = 0

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

au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.arb setf ruby
au BufRead,BufNewFile *.tag setf coffee " riotjs tags
au BufRead,BufNewFile *.vue setf coffee " riotjs tags

" silent! nmap <C-f> :FufLine<CR>
" silent! nmap <C-g> :FufCoverageFile<CR>
"
" Airline
let g:airline_theme      = 'solarized'
let g:airline_section_y  = ''  " Don't display encoding
let g:airline_left_sep   = '▶' " Set custom left separator
let g:airline_right_sep  = '◀' " Set custom right separator
"let g:airline#extensions#tabline#enabled      = 1      " Enable airline for tab-bar
"let g:airline#extensions#tabline#show_buffers = 0 " Don't display buffers in tab-bar with single tab
"let g:airline#extensions#tabline#fnamemod     = ':t'  " Display only filename in tab

" Vim gitgutter
let g:gitgutter_sign_added = '█'
let g:gitgutter_sign_modified = '█'
let g:gitgutter_sign_removed = '█'
let g:gitgutter_sign_removed_first_line = '█'
let g:gitgutter_sign_modified_removed = '█'

let g:ctrlp_map = '<c-g>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v(node_modules|vendor\/bundle)$'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

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

" Automatically clean trailing whitespaces on save
autocmd BufWritePre *.* :call <SID>StripTrailingWhitespaces()

set noswapfile
set background=dark
" colorscheme coldrails
set t_Co=256
colorscheme solarized
call togglebg#map("<F5>")

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
set synmaxcol=160

set incsearch
set hlsearch   " Highlight searches
set ruler              " Ruler on

set colorcolumn=+1

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
:autocmd InsertEnter * set cul   " Show cursor line in insert mode
:autocmd InsertLeave * set nocul " Hide cursor line in insert mode

" Visual
set showmatch    " Show matching brackets.
set mat=5        " Bracket blinking.
                 " Show $ at end of line and trailing space as ~
set novisualbell " No blinking .
set noerrorbells " No noise.
set laststatus=2 " Always show status line.

" Invisibles
set list                    " show invisibles
set listchars=tab:▸\ ,eol:¬

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
