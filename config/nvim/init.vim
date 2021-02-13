set nocompatible
filetype off

source /usr/share/nvim/runtime/plugin/fzf.vim

call plug#begin('$HOME/.config/nvim/bundle')

Plug 'tpope/vim-sensible'

" Colors
Plug 'chriskempson/base16-vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'Lokaltog/vim-easymotion'

Plug 'rust-lang/rust.vim'
" Plug 'racer-rust/vim-racer'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'calviken/vim-gdscript3'
" Plug 'tpope/vim-projectionist'
" Plug 'tpope/vim-haml'
Plug 'ledger/vim-ledger'
Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go'
" Plug 'wavded/vim-stylus'
" Plug 'digitaltoad/vim-jade'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'HerringtonDarkholme/yats.vim'

Plug 'tomtom/tcomment_vim'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

Plug 'scrooloose/nerdtree'
Plug 'milkypostman/vim-togglelist' " <leader>l and <leader>q

" Snippets
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'
Plug 'honza/vim-snippets'

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'
Plug 'shinchu/lightline-gruvbox.vim'

" Plug 'ryanoasis/vim-devicons'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer'

Plug 'junegunn/fzf.vim'

Plug 'godlygeek/tabular'
Plug 'nathanaelkane/vim-indent-guides'

" Linters and syntax stuff
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'w0rp/ale'
"
" Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'janko/vim-test'

" Tasks
Plug 'blindFS/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'tbabej/taskwiki'

call plug#end()

" Colorscheme
set t_Co=256
set termguicolors
set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard

" NERD Commenter
" Add spaces after comment delimiters by default
" let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
" let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
" let g:NERDDefaultAlign = 'left'
" Allow commenting and inverting empty lines (useful when commenting a region)
" let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
" let g:NERDTrimTrailingWhitespace = 0

" Snipmate
" imap <S-Enter> <Plug>snipMateNextOrTrigger
" let g:snipMate = get(g:, 'snipMate', {}) " Allow for vimrc re-sourcing

" coc.nvim
"
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" let g:node_client_debug = 1

let g:coc_global_extensions = [
  \ 'coc-css',
  \ 'coc-fish',
  \ 'coc-html',
  \ 'coc-lists',
  \ 'coc-omni',
  \ 'coc-sh',
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ 'coc-docker',
  \ 'coc-highlight',
  \ 'coc-json',
  \ 'coc-neosnippet',
  \ 'coc-rust-analyzer',
  \ 'coc-solargraph',
  \ 'coc-yaml'
  \ ]

highlight CocErrorSign   ctermfg=9 ctermbg=18 guifg=#ff0000 guibg=#3c3836
highlight CocWarningSign ctermfg=130 ctermbg=18 guifg=#ff922b guibg=#3c3836
highlight CocInfoSign    ctermfg=11 ctermbg=18 guifg=#fab005 guibg=#3c3836
highlight CocHintSign    ctermfg=12 ctermbg=18 guifg=#15aabf guibg=#3c3836

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gl :CocList outline<CR>

nnoremap <Leader>s :CocSearch<Space>

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap for do codeAction of current line
" nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Required for operations modifying multiple buffers like rename.
set hidden

" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ledger setlocal sw=4 ts=4 sts=4
autocmd FileType rust setlocal sw=4 ts=4 sts=4

" Neocomplete snippets
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$HOME/.config/nvim/bundle/vim-snippets/snippets'

" ALE
" let g:ale_sign_column_always = 1
let g:ale_enabled = 1
let g:ale_list_window_size = 3
let g:ale_lint_on_save = 1
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_open_list = 0
let g:ale_linters_explicit = 1

let g:ale_linters = {
      \ 'ruby': ['reek'],
      \ 'scss': ['stylelint'],
      \ 'sass': ['stylelint'],
      \  'css': ['stylelint'],
      \ 'slim': ['slimlint'],
      \ }

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" let g:ale_set_loclist = 0
" let g:ale_set_quickfix = 1
" let g:ale_keep_list_window_open = 1

" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_set_highlights = 1

let g:ale_sign_error = 'E>'
let g:ale_sign_warning = 'W>'

let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%severity%] %s [%linter%]'

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" FZF ripgrep
nnoremap <Leader>g :Rg<Space>

" NerdTREE
silent! nmap <C-g> :NERDTreeToggle<CR>
silent! map <F4> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F4>"
let g:NERDTreeMapPreview="<F3>"

" RustFmt rust
" let g:rustfmt_autosave = 1

" Racer
" let g:racer_experimental_completer = 1
" au FileType rust nmap gd <Plug>(rust-def)
" au FileType rust nmap gs <Plug>(rust-def-split)
" au FileType rust nmap gx <Plug>(rust-def-vertical)
" au FileType rust nmap <leader>gd <Plug>(rust-doc)

au BufRead,BufNewFile *.jbuilder setf ruby
au BufRead,BufNewFile *.rabl setf ruby
au BufRead,BufNewFile *.arb setf ruby
au BufRead,BufNewFile *.axlsx setf ruby
au BufRead,BufNewFile *.tag setf coffee " riotjs tags

" silent! nmap <C-f> :FufLine<CR>
" silent! nmap <C-g> :FufCoverageFile<CR>
"
" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_checking': 'lightline#ale#checking',
      \  'linter_warnings': 'lightline#ale#warnings',
      \  'linter_errors': 'lightline#ale#errors',
      \  'linter_ok': 'lightline#ale#ok',
      \ }

let g:lightline.component_function = {
      \   'cocstatus': 'coc#status'
      \ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
      \ }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \           [ 'cocstatus' ]],
      \ 'right': [ [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ],
      \            [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ }

set shell=fish

" Terminal
tnoremap <Esc> <C-\><C-n>
command Term split term://fish
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod = 'rightbelow'
let g:neoterm_size = '20'

" vim-test
" make test commands execute using neoterm
let test#strategy = "neoterm"

nnoremap <Leader>tn :TestNearest<CR>
nnoremap <Leader>tf :TestFile<CR>
nnoremap <Leader>ts :TestSuite<CR>

" Vim gitgutter
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
" let g:gitgutter_sign_added = ' '
" let g:gitgutter_sign_modified = ' '
" let g:gitgutter_sign_removed = ' '
" let g:gitgutter_sign_removed_first_line = ' '
" let g:gitgutter_sign_modified_removed = ' '
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'
let g:gitgutter_sign_modified_removed = '~'
let g:gitgutter_highlight_linenrs = 1
let g:gitgutter_highlight_lines = 0

highlight GitGutterChangeLineNr ctermfg=16 ctermbg=18 guifg=#83a598 guibg=#3c3836
highlight GitGutterChangeDeleteLineNr ctermfg=16 ctermbg=18 guifg=#d3869b guibg=#3c3836

highlight link GitGutterAddLineNr GitGutterAddLine
highlight link GitGutterDeleteLineNr GitGutterDeleteLine

" fzf
let $FZF_DEFAULT_COMMAND="fd --type file --full-path -c never -H -E node_modules -E vendor -E public -E tmp -E log -E .git -E .hg -E .svn -E '*.min.js' -E '*.log' -E '.keep'"

silent! nmap <C-p> :Files<CR>

" An action can be a reference to a function that processes selected lines
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-o': 'edit' }

let g:fzf_preview_window = 'right:60%'

" let g:fzf_layout = { 'window': { 'width': 0.4, 'height': 0.25 } }
" let g:fzf_preview_window = ''
let g:fzf_buffers_jump = 1

autocmd! FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Replace current word with yanked or deleted text
" nnoremap S "_diwP

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

" vim-indent-guides
" let g:indent_guides_enable_on_vim_startup = 1
" let g:indent_guides_auto_colors = 0
" let g:indent_guides_guide_size = 1
" let g:indent_guides_start_level = 2
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
" autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=0

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" FIXME: this is strange workaround for workaround for bug in kitty
autocmd FileType vimwiki nnoremap <Leader>wH <Plug>VimwikiGoBackLink

" Taskwiki
let g:taskwiki_markup_syntax = "markdown"
" let g:taskwiki_source_tw_colors = "yes"
nnoremap <Leader>tR :TaskWikiBufferLoad<CR>

set noswapfile

set ofu=syntaxcomplete#Complete
set ts=2           " Tabs are 2 spaces
set bs=2           " Backspace over everything in insert mode
set shiftwidth=2   " Tabs under smart indent

set cf                 " Enable error files & error jumping.
set clipboard=unnamed  " Yanks go on clipboard instead.
set nu                 " Line numbers on
set relativenumber

set wrap
set linebreak
" set timeoutlen=250 " Time to wait after ESC (default causes an annoying delay)

set cmdheight=1

set updatetime=300

set hlsearch   " Highlight searches

set re=0
" set ttyfast
" set lazyredraw
set redrawtime=1000

" Search
set ignorecase smartcase " Ignore case of searches

set cinoptions=:0,p0,t0
set cinwords=if,else,while,do,for,switch,case,begin
set formatoptions=tcqr
set cindent
set expandtab

set colorcolumn=80,120

set nostartofline                " Don’t reset cursor to start of line when moving around.
set noeol                        " Don’t add empty newlines at the end of files
autocmd InsertEnter * set cursorline    " Show cursor line in insert mode
autocmd InsertLeave * set nocursorline  " Hide cursor line in insert mode

" Visual
set showmatch    " Show matching brackets.
set mat=5        " Bracket blinking.
                 " Show $ at end of line and trailing space as ~
set novisualbell " No blinking .
set noerrorbells " No noise.

" Invisibles
set list listchars=tab:▸·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

" Disable folding
set nofoldenable

" Disable some keys
noremap   <Up>       <NOP>
noremap   <Down>     <NOP>
noremap   <Left>     <NOP>
noremap   <Right>    <NOP>
noremap   <PageUp>   <NOP>
noremap   <PageDown> <NOP>
noremap   <Home>     <NOP>
noremap   <End>      <NOP>
inoremap  <PageUp>   <NOP>
inoremap  <PageDown> <NOP>
inoremap  <Home>     <NOP>
inoremap  <End>      <NOP>

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

set title

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
