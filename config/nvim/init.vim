set nocompatible
filetype off

call plug#begin('$HOME/.config/nvim/bundle')

Plug 'tpope/vim-sensible'

" Colors
Plug 'chriskempson/base16-vim'

Plug 'terryma/vim-multiple-cursors'
Plug 'Lokaltog/vim-easymotion'

Plug 'simrat39/rust-tools.nvim'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-markdown'
Plug 'calviken/vim-gdscript3'
Plug 'ledger/vim-ledger'
Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'm-pilia/vim-ccls'
Plug 'm-pilia/vim-yggdrasil'

" Fish shell
Plug 'dag/vim-fish'

" Zig
Plug 'ziglang/zig.vim'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

Plug 'tomtom/tcomment_vim'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

Plug 'scrooloose/nerdtree'
Plug 'milkypostman/vim-togglelist' " <leader>l and <leader>q

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'bsedin/lightline-lsp'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer'

Plug 'godlygeek/tabular'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'folke/lsp-colors.nvim'

Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'saadparwaiz1/cmp_luasnip'

" Plug 'tpope/vim-dispatch'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
Plug 'janko/vim-test'

" Tasks
Plug 'blindFS/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'
Plug 'vimwiki/vimwiki'
Plug 'tbabej/taskwiki'

Plug 'McAuleyPenney/tidy.nvim' " Remove whitespaces
Plug 'Chiel92/vim-autoformat'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Colorscheme
set t_Co=256
set termguicolors
set background=dark
let base16colorspace=256
colorscheme base16-gruvbox-dark-hard

" Required for operations modifying multiple buffers like rename.
set hidden

" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ledger setlocal sw=4 ts=4 sts=4
autocmd FileType rust setlocal sw=4 ts=4 sts=4

" For conceal markers.
if has('conceal')
  set conceallevel=0 concealcursor=niv
endif

" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1
"
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='$HOME/.config/nvim/bundle/vim-snippets/snippets'


lua << EOF

-- telescope

require('telescope').setup{
  -- defaults = {
  --   layout_config = {
  --     vertical = { width = 0.9 }
  --   }
  -- },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    live_grep = {
      theme = "ivy",
    }
  },
}

-- nvim-lspconfig

local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.get()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

  -- buf_set_keymap('n', 'gh', '<cmd>lua require(\'lspsaga.provider\').lsp_finder()<CR>', opts)
  -- buf_set_keymap('n', '<leader>ca', '<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>', opts)
  -- buf_set_keymap('v', '<leader>ca', ':<C-U>lua require(\'lspsaga.codeaction\').range_code_action()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', opts)
  -- buf_set_keymap('n', '<space>rn', '<cmd>lua require(\'lspsaga.rename\').rename()<CR>', opts)
  -- buf_set_keymap('n', 'gs', '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua require(\'lspsaga.provider\').preview_definition()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua require(\'lspsaga.provider\').preview_definition()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
  'eslint',
  'erlangls',
  'solargraph',
  'tsserver',
  'stylelint_lsp',
  'eslint',
  'zls',
  'ansiblels',
  'bashls',
  'ccls',
  'gdscript',
}

-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)


for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    flags = {
      debounce_text_changes = 400,
    },
    on_attach = on_attach,
    capabilities = capabilities
  }
end

nvim_lsp.elixirls.setup{
    cmd = { "elixir-ls" },
    on_attach = on_attach,
    capabilities = capabilities
}

nvim_lsp.rust_analyzer.setup({
    cmd = { "rust-analyzer" },
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        ["rust-analyzer"] = {
            assist = {
                importGranularity = "module",
                importPrefix = "by_self",
            },
            cargo = {
                loadOutDirsFromCheck = true
            },
            procMacro = {
                enable = true
            },
        }
    }
})

nvim_lsp.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      tailwindCSS = {
        emmetCompletions = true,
      }
    }
})

require('rust-tools').setup({
  tools = { -- rust-tools options
          autoSetHints = true,
          hover_with_actions = true,
          inlay_hints = {
              -- show_parameter_hints = false,
              -- parameter_hints_prefix = "",
              -- other_hints_prefix = "",
          },
      },

      -- all the opts to send to nvim-lspconfig
      -- these override the defaults set by rust-tools.nvim
      -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
      server = {
          -- on_attach is a callback called when the language server attachs to the buffer
          on_attach = on_attach,
          settings = {
              -- to enable rust-analyzer settings visit:
              -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
              ["rust-analyzer"] = {
                  -- enable clippy on save
                  checkOnSave = {
                      allTargets = false,
                      command = "clippy"
                  },
              }
          }
      },
})

-- Setup nvim-cmp.
local cmp = require('cmp')
local luasnip = require('luasnip')
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

cmp.setup({
  experimental = {
    ghost_text = { hl_group = 'Comment' }
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
      -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),

    ['<C-y>'] =
    cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),

    ['<C-n>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-p>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' }, -- For luasnip users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

EOF

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" NerdTREE
silent! nmap <C-g> :NERDTreeToggle<CR>
silent! map <F4> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F4>"
let g:NERDTreeMapPreview="<F3>"

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:lightline.component_expand = {
      \  'linter_hints': 'lightline#lsp#hints',
      \  'linter_infos': 'lightline#lsp#infos',
      \  'linter_warnings': 'lightline#lsp#warnings',
      \  'linter_errors': 'lightline#lsp#errors',
      \  'linter_ok': 'lightline#lsp#ok',
      \ }

let g:lightline.component_type = {
      \     'linter_hints': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \ }

let g:lightline.active = {
      \ 'left': [ [ 'mode', 'paste' ],
      \           [ 'gitbranch', 'readonly', 'filename', 'modified' ]],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ],
      \            [ 'linter_errors', 'linter_warnings', 'linter_infos', 'linter_hints', 'linter_ok' ]]
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

" vim-autoformat
let g:autoformat_autoindent = 1
let g:autoformat_retab = 1
let g:autoformat_remove_trailing_spaces = 1

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

" Set updatetime for CursorHold
" 300ms of no cursor movement to trigger CursorHold
set updatetime=1000
" Show diagnostic popup on cursor hold
autocmd CursorHold * lua vim.diagnostic.open_float(nil, { focusable = false })

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
set completeopt=menuone,noinsert,noselect

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" telescope
nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<CR>
nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<CR>
