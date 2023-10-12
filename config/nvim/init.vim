set nocompatible
filetype off

call plug#begin('$HOME/.config/nvim/bundle')

Plug 'tpope/vim-sensible'

" Gruvbox colors
" Plug 'ellisonleao/gruvbox.nvim'
Plug '~/Projects/libs/gruvbox.nvim'

" Plug 'terryma/vim-multiple-cursors'
Plug 'mg979/vim-visual-multi'
" Plug 'Lokaltog/vim-easymotion'
Plug 'ggandor/leap.nvim'

Plug 'simrat39/rust-tools.nvim'
" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-markdown'
Plug 'ledger/vim-ledger'
Plug 'slim-template/vim-slim'
Plug 'fatih/vim-go'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'm-pilia/vim-ccls'
Plug 'm-pilia/vim-yggdrasil'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Fish shell
Plug 'dag/vim-fish'

" Zig
Plug 'ziglang/zig.vim'

" Elixir
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

Plug 'tomtom/tcomment_vim'

Plug 'majutsushi/tagbar', { 'on': 'TagbarToggle' }

Plug 'milkypostman/vim-togglelist' " <leader>l and <leader>q

" Snippets
Plug 'L3MON4D3/LuaSnip'

" Appearance
Plug 'itchyny/lightline.vim'
Plug 'bsedin/lightline-lsp'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
" Plug 'rstacruz/vim-closer' # bugged

Plug 'godlygeek/tabular'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tamago324/nlsp-settings.nvim'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'folke/lsp-colors.nvim'
" Plug 'jose-elias-alvarez/null-ls.nvim'

Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" For luasnip users.
Plug 'saadparwaiz1/cmp_luasnip'

" Plug 'tpope/vim-dispatch'
" Plug 'airblade/vim-gitgutter'
Plug 'lewis6991/gitsigns.nvim'

Plug 'tpope/vim-fugitive'
Plug 'kassio/neoterm'
" Plug 'janko/vim-test'

Plug 'nvim-neotest/neotest'
Plug 'olimorris/neotest-rspec'

Plug 'yssl/QFEnter'

" Tasks
" Plug 'blindFS/vim-taskwarrior'
Plug 'powerman/vim-plugin-AnsiEsc'
" Plug 'vimwiki/vimwiki'
" Plug 'tbabej/taskwiki'

Plug 'McAuleyPenney/tidy.nvim' " Remove whitespaces
Plug 'Chiel92/vim-autoformat'

Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
Plug 'junegunn/fzf.vim'

Plug 'MunifTanjim/nui.nvim'
Plug 'nvim-neo-tree/neo-tree.nvim'

call plug#end()

" Colorscheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set t_Co=256
set termguicolors

" Gruvbox colors
" autocmd vimenter * ++nested colorscheme mygruvbox
" let g:gruvbox_contrast_dark='medium'
" let g:gruvbox_contrast_light='medium'

colorscheme gruvbox
" let neovim guess
" set background=dark
" silent! map <F5> :set background=dark<CR>
" silent! map <F6> :set background=light<CR>

" Required for operations modifying multiple buffers like rename.
set hidden

" autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType ledger setlocal sw=4 ts=4 sts=4
autocmd FileType rust setlocal sw=4 ts=4 sts=4

au BufNewFile,BufRead *.es6 :setlocal filetype=javascript

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
require('gitsigns').setup()

-- tree-sitter

require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  -- ensure_installed = { "all" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

-- telescope
-- require('telescope').setup{
--   -- defaults = {
--   --   layout_config = {
--   --     vertical = { width = 0.9 }
--   --   }
--   -- },
--   defaults = {
--     preview = {
--       treesitter = false,
--     },
--   },
--   pickers = {
--     find_files = {
--       theme = "ivy",
--     },
--     live_grep = {
--       theme = "ivy",
--     }
--   },
-- }

-- nvim-lspconfig

local nvim_lsp = require('lspconfig')
local nlspsettings = require("nlspsettings")

nlspsettings.setup({
  config_home = vim.fn.stdpath('config') .. '/nlsp-settings',
  local_settings_dir = ".nlsp-settings",
  local_settings_root_markers_fallback = { '.git' },
  append_default_schemas = true,
  loader = 'json'
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  client.server_capabilities.semanticTokensProvider = nil

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
  'ansiblels',
  'bashls',
  'ccls',
  'erlangls',
  'eslint',
  'gdscript',
  -- 'ruby_ls',
  'solargraph',
  'stylelint_lsp',
  'tsserver',
  'zls',
}


-- Setup lspconfig.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    flags = {
      debounce_text_changes = 1000,
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

-- nvim_lsp.rust_analyzer.setup({
--     cmd = { "rust-analyzer" },
--     on_attach = on_attach,
--     capabilities = capabilities,
--     settings = {
--         ["rust-analyzer"] = {
--             assist = {
--                 importGranularity = "module",
--                 importPrefix = "by_self",
--             },
--             cargo = {
--                 loadOutDirsFromCheck = true
--             },
--             procMacro = {
--                 enable = true
--             },
--         }
--     }
-- })

nvim_lsp.tailwindcss.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      tailwindCSS = {
        emmetCompletions = true,
      }
    }
})

-- require('rust-tools').setup({
--   tools = { -- rust-tools options
--           autoSetHints = true,
--           hover_with_actions = true,
--           inlay_hints = {
--               -- show_parameter_hints = false,
--               -- parameter_hints_prefix = "",
--               -- other_hints_prefix = "",
--           },
--       },
--
--       -- all the opts to send to nvim-lspconfig
--       -- these override the defaults set by rust-tools.nvim
--       -- see https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#rust_analyzer
--       server = {
--           -- on_attach is a callback called when the language server attachs to the buffer
--           on_attach = on_attach,
--           settings = {
--               -- to enable rust-analyzer settings visit:
--               -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
--               ["rust-analyzer"] = {
--                   -- enable clippy on save
--                   checkOnSave = {
--                       allTargets = false,
--                       command = "clippy"
--                   },
--               }
--           }
--       },
-- })

-- textDocument/diagnostic support until 0.10.0 is released
_timers = {}
local function setup_diagnostics(client, buffer)
  if require("vim.lsp.diagnostic")._enable then
    return
  end

  local diagnostic_handler = function()
    local params = vim.lsp.util.make_text_document_params(buffer)
    client.request("textDocument/diagnostic", { textDocument = params }, function(err, result)
      if err then
        local err_msg = string.format("diagnostics error - %s", vim.inspect(err))
        vim.lsp.log.error(err_msg)
      end
      local diagnostic_items = {}
      if result then
        diagnostic_items = result.items
      end
      vim.lsp.diagnostic.on_publish_diagnostics(
        nil,
        vim.tbl_extend("keep", params, { diagnostics = diagnostic_items }),
        { client_id = client.id }
      )
    end)
  end

  diagnostic_handler() -- to request diagnostics on buffer when first attaching

  vim.api.nvim_buf_attach(buffer, false, {
    on_lines = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
      _timers[buffer] = vim.fn.timer_start(200, diagnostic_handler)
    end,
    on_detach = function()
      if _timers[buffer] then
        vim.fn.timer_stop(_timers[buffer])
      end
    end,
  })
end

nvim_lsp.ruby_ls.setup({
  on_attach = function(client, buffer)
    setup_diagnostics(client, buffer)
  end,
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

require("neo-tree").setup({
  close_if_last_window = false, -- Close Neo-tree if it is the last window left in the tab
  popup_border_style = "rounded",
  enable_git_status = false,
  enable_diagnostics = false,
  sort_case_insensitive = false, -- used when sorting files and directories in the tree
  sort_function = nil , -- use a custom function for sorting files and directories in the tree
  -- sort_function = function (a,b)
  --       if a.type == b.type then
  --           return a.path > b.path
  --       else
  --           return a.type > b.type
  --       end
  --   end , -- this sorts files and directories descendantly
  default_component_configs = {
    container = {
      enable_character_fade = false
    },
    indent = {
      indent_size = 2,
      padding = 1, -- extra padding on left hand side
      -- indent guides
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
      highlight = "NeoTreeIndentMarker",
      -- expander config, needed for nesting files
      with_expanders = nil, -- if nil and file nesting is enabled, will enable expanders
      expander_collapsed = "",
      expander_expanded = "",
      expander_highlight = "NeoTreeExpander",
    },
    icon = {
      folder_closed = "▸",
      folder_open = "▾",
      folder_empty = " ",
      -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
      -- then these will never be used.
      default = "",
      highlight = "NeoTreeFileIcon"
    },
    modified = {
      symbol = "[+]",
      highlight = "NeoTreeModified",
    },
    name = {
      trailing_slash = false,
      use_git_status_colors = false,
      highlight = "NeoTreeFileName",
    },
    git_status = {
      symbols = {
        -- Change type
        added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
        modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
        deleted   = "✖",-- this can only be used in the git_status source
        renamed   = "",-- this can only be used in the git_status source
        -- Status type
        untracked = "",
        ignored   = "",
        unstaged  = "",
        staged    = "",
        conflict  = "",
      }
    },
  },
  filesystem = {
    filtered_items = {
      visible = false,
      never_show = {
        ".git",
        ".keep",
        ".gitkeep",
      },
    },
    window = {
      mappings = {
        ["/"] = false,
        ["D"] = false,
      },
    },
  },
  window = {
    position = "left",
    width = 40,
    mapping_options = {
      noremap = true,
      nowait = true,
    },
    mappings = {
      ["<F4>"] = "open",
      ["C"] = "cut_to_clipboard",
      ["i"] = "toggle_hidden",
      ["x"] = "close_node",
      ["X"] = "close_all_nodes",
      ["z"] = false,
      ["Z"] = false,
      ["c"] = { "copy", config = { show_path = "relative" }},
      ["m"] = { "move", config = { show_path = "relative" }},
      ["a"] = { "add", config = { show_path = "relative" }},
    },
  },
})

require('leap').set_default_keymaps()

require('neotest').setup({
  icons = {
    -- Ascii:
    -- { "/", "|", "\\", "-", "/", "|", "\\", "-"},
    -- Unicode:
    -- { "", "🞅", "🞈", "🞉", "", "", "🞉", "🞈", "🞅", "", },
    -- {"◴" ,"◷" ,"◶", "◵"},
    -- {"◢", "◣", "◤", "◥"},
    -- {"◐", "◓", "◑", "◒"},
    -- {"◰", "◳", "◲", "◱"},
    -- {"⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷"},
    -- {"⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"},
    -- {"⠋", "⠙", "⠚", "⠞", "⠖", "⠦", "⠴", "⠲", "⠳", "⠓"},
    -- {"⠄", "⠆", "⠇", "⠋", "⠙", "⠸", "⠰", "⠠", "⠰", "⠸", "⠙", "⠋", "⠇", "⠆"},
    -- { "⠋", "⠙", "⠚", "⠒", "⠂", "⠂", "⠒", "⠲", "⠴", "⠦", "⠖", "⠒", "⠐", "⠐", "⠒", "⠓", "⠋" },
    running_animated = {"⣷", "⣯", "⣟", "⡿", "⢿", "⣻", "⣽", "⣾"},
    passed = " ",
    running = " ",
    failed = " ",
    skipped = "-",
    unknown = "🞅",
    non_collapsible = "─",
    collapsed = "─",
    expanded = "╮",
    child_prefix = "├",
    final_child_prefix = "╰",
    child_indent = "│",
    final_child_indent = " ",
  },
  adapters = {
    require('neotest-rspec')({
      rspec_cmd = function()
        return vim.tbl_flatten({
          "rspec",
        })
      end
    })
  },
  quickfix = {
    enabled = false,
    open = false
  },
})

-- local null_ls = require("null-ls")
--
-- null_ls.setup({
--     sources = {
--         null_ls.builtins.formatting.stylua,
--         null_ls.builtins.completion.spell,
--         null_ls.builtins.diagnostics.eslint,
--         null_ls.builtins.diagnostics.rubocop,
--     },
-- })

-- map("n", "<Leader>tn", ":lua require('neotest').run.run()<CR>", { noremap = false, silent = false })

-- buf_set_keymap('n', '<Leader>tn', '<cmd>lua require('neotest').run.run()<CR>', opts)
-- buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- nnoremap <Leader>tn :TestNearest<CR>
-- nnoremap <Leader>tf :TestFile<CR>
-- nnoremap <Leader>ts :TestSuite<CR>
EOF

" neotest keybindings
nnoremap <Leader>tn <cmd>lua require("neotest").run.run()<CR>
nnoremap <Leader>ts <cmd>lua require("neotest").run.stop()<CR>
nnoremap <Leader>tf <cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>
nnoremap <Leader>tt <cmd>lua require("neotest").summary.open()<CR>
nnoremap <Leader>ta <cmd>lua require("neotest").run.attach()<CR>
nnoremap <Leader>to <cmd>lua require("neotest").output.open({ enter = true })<CR>
nnoremap <silent>[n <cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>
nnoremap <silent>]n <cmd>lua require("neotest").jump.next({ status = "failed" })<CR>

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']

" NeoTree
silent! nmap <C-g> :NeoTreeShowToggle<CR>
silent! map <F4> :NeoTreeReveal<CR>

" Lightline
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
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

" Vim gitgutter
" let g:gitgutter_enabled = 1
" let g:gitgutter_signs = 1
" let g:gitgutter_sign_added = '+'
" let g:gitgutter_sign_modified = '~'
" let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_removed_first_line = '-'
" let g:gitgutter_sign_modified_removed = '~'
" let g:gitgutter_highlight_linenrs = 1
" let g:gitgutter_highlight_lines = 1

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
" let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" FIXME: this is strange workaround for workaround for bug in kitty
" autocmd FileType vimwiki nnoremap <Leader>wH <Plug>VimwikiGoBackLink


" vim-markdown
let g:markdown_syntax_conceal = 0

" Taskwiki
" let g:taskwiki_markup_syntax = "markdown"
" let g:taskwiki_source_tw_colors = "yes"
" nnoremap <Leader>tR :TaskWikiBufferLoad<CR>

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

" Disable mouse
set mouse=

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

set completeopt=menuone,noinsert,noselect

set signcolumn=yes

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" telescope
" nnoremap <C-p> <cmd>lua require('telescope.builtin').find_files()<CR>
" nnoremap <leader>g <cmd>lua require('telescope.builtin').live_grep()<CR>
" nnoremap <leader>b <cmd>lua require('telescope.builtin').buffers()<CR>
" nnoremap <leader>h <cmd>lua require('telescope.builtin').help_tags()<CR>

" FZF
let g:fzf_layout = { 'down': '30%' }
let g:fzf_vim = {}
let g:fzf_vim.preview_window = ['right,50%', 'ctrl-/']

nnoremap <C-p> :FZF<CR>
nnoremap <leader>g :Rg<CR>

" LSP SEMANTIC HIGHLIGHTS
" hi @lsp.type.variable guifg=GruvboxFg1
" hi @lsp.type.class guifg=GruvboxYellow
