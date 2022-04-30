set cursorline
set expandtab
set shiftwidth=4
set tabstop=4
set hidden
set signcolumn=yes:2
set relativenumber
set number
set termguicolors
set undofile
set spell
set title
set ignorecase
set smartcase
set wildmode=longest:full,full
set nowrap
set list
set listchars=tab:▸\ ,trail:·
set mouse=a
set scrolloff=8
set sidescrolloff=8
set nojoinspaces
set splitright
set clipboard=unnamedplus
set confirm
set exrc
set backup
set backupdir=~/.local/share/nvim/backup//
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set ma
set foldmethod=manual

set termguicolors

"--------------------------------------------------------------------------
" Key maps
"--------------------------------------------------------------------------

let mapleader = "\<space>"
nmap <leader>ve :edit ~/.config/nvim/init.vim<cr>
nmap <leader>vr :source ~/.config/nvim/init.vim<cr>
nmap <leader>vk :source ~/.config/nvim/plugins/text-expender.vim<cr>
nmap <leader>k :nohlsearch<CR
nmap <leader>Q :bufdo bdelete<cr>

" Allow gf to open non-existent files
map gf :edit <cfile><cr>

" Reselect visual selection after indenting
vnoremap < <gv
vnoremap > >gv

" Maintain the cursor position when yanking a visual selection
" http://ddrscott.github.io/blog/2016/yank-without-jank/
vnoremap y myy`y
vnoremap Y myY`y

" When text is wrapped, move by terminal rows, not lines, unless a count is provided
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Paste replace visual selection without copying it
vnoremap <leader>p "_dP

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------
"

" Automatically install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(data_dir . '/plugins')

Plug 'ainnhe/everforest'
Plug 'EdenEast/nightfox.nvim' 
Plug 'yianwillis/vimcdoc'
Plug 'mattn/emmet-vim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'github/copilot.vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'tpope/vim-fugitive'
Plug 'davidbeckingsale/writegood.vim'
Plug 'lewis6991/gitsigns.nvim'
source ~/.config/nvim/plugins/airline.vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'
"source ~/.config/nvim/plugins/commentary.vim
"source ~/.config/nvim/plugins/context-commentstring.vim
Plug 'numToStr/Comment.nvim'
Plug 'uga-rosa/translate.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
source ~/.config/nvim/plugins/dracula.vim
source ~/.config/nvim/plugins/editorconfig.vim
source ~/.config/nvim/plugins/eunuch.vim
source ~/.config/nvim/plugins/firenvim.vim
source ~/.config/nvim/plugins/floaterm.vim
source ~/.config/nvim/plugins/heritage.vim
" source ~/.config/nvim/plugins/nerdtree.vim
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
source ~/.config/nvim/plugins/pasta.vim
source ~/.config/nvim/plugins/polyglot.vim
source ~/.config/nvim/plugins/quickscope.vim
source ~/.config/nvim/plugins/repeat.vim
source ~/.config/nvim/plugins/sayonara.vim
source ~/.config/nvim/plugins/smooth-scroll.vim
source ~/.config/nvim/plugins/splitjoin.vim
Plug 'phaazon/hop.nvim'
Plug 'norcalli/nvim-colorizer.lua'
"Plug 'folke/which-key.nvim'
source ~/.config/nvim/plugins/surround.vim
source ~/.config/nvim/plugins/lsp.vim
source ~/.config/nvim/plugins/autopairs.vim
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'

call plug#end()

lua << EOF

--lsp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

local on_attach = function(client, bufnr)
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

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
  buf_set_keymap('n', '<space>gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { "gopls",  'cssls', 'pyright', "dockerls", "vuels", "html" }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.tsserver.setup({
    -- Needed for inlayHints. Merge this table with your settings or copy
    -- it from the source if you want to add your own init_options.
    init_options = require("nvim-lsp-ts-utils").init_options,
    --
    on_attach = function(client, bufnr)
        on_attach(client, bufnr)
        local ts_utils = require("nvim-lsp-ts-utils")

        -- defaults
        ts_utils.setup({
            debug = false,
            disable_commands = false,
            enable_import_on_completion = false,

            -- import all
            import_all_timeout = 5000, -- ms
            -- lower numbers = higher priority
            import_all_priorities = {
                same_file = 1, -- add to existing import statement
                local_files = 2, -- git files or files with relative path markers
                buffer_content = 3, -- loaded buffer content
                buffers = 4, -- loaded buffer names
            },
            import_all_scan_buffers = 100,
            import_all_select_source = false,
            -- if false will avoid organizing imports
            always_organize_imports = true,

            -- filter diagnostics
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},

            -- inlay hints
            auto_inlay_hints = true,
            inlay_hints_highlight = "Comment",
            inlay_hints_priority = 200, -- priority of the hint extmarks
            inlay_hints_throttle = 150, -- throttle the inlay hint request
            inlay_hints_format = { -- format options for individual hint kind
                Type = {},
                Parameter = {},
                Enum = {},
                -- Example format customization for `Type` kind:
                -- Type = {
                --     highlight = "Comment",
                --     text = function(text)
                --         return "->" .. text:sub(2)
                --     end,
                -- },
            },

            -- update imports on file move
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil,
        })

        -- required to fix code action ranges and filter diagnostics
        ts_utils.setup_client(client)

        -- no default maps, so you may want to define some here
        local opts = { silent = true }
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gk", ":TSLspImportAll<CR>", opts)
    end,
})

-- end tsserver

require'lspconfig'.zeta_note.setup{
  cmd = {'/home/qs/sdks/lua-server/bin'}
}

-- nvim-cmp setup
local cmp = require 'cmp'
local sni = require('snippy')
cmp.setup {
  snippet = {
      expand = function(args)
         require('snippy').expand_snippet(args.body) -- For `snippy` users.
      end,
    },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    --[[['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif sni.can_expand_or_advance()then
        sni.expand_or_advance()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif sni.can_jump(-1) then
       sni.can_jump(-1)
      else
        fallback()
      end
    end,
    ]]
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'snippy' },
  },
}


local null_ls = require('null-ls')

-- register any number of sources simultaneously
local sources = {
    null_ls.builtins.formatting.prettier.with({
      prefer_local = "node_modules/.bin",
    }),
    null_ls.builtins.formatting.goimports,
    -- null_ls.builtins.formatting.black,
    
    null_ls.builtins.formatting.autopep8,

    null_ls.builtins.diagnostics.write_good,
    null_ls.builtins.code_actions.gitsigns,
}

null_ls.setup({ 
    sources = sources,
    on_attach = function(client)
        if client.resolved_capabilities.document_formatting then
            vim.cmd([[
            augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()
            augroup END
            ]])
        end
    end,
})

require('nvim-autopairs').setup{}

-- nvim-tree: file manager
require'nvim-tree'.setup {}

-- catppuccin
local catppuccin = require("catppuccin")
catppuccin.setup({
  transparent_background = true, 
  nvimtree = {
        enabled = true,
		show_root = false,
		transparent_panel = true,
	},
})

-- gitsigns
require("gitsigns").setup(
    {
      -- 设置在左侧的行号列中显示的 git 信息
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
    }
)


-- comment
require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true
  }
}

require('Comment').setup()

-- translate 

local options = {
    default = {
        command = "translate_shell",
        output = "floating",
        parse_after = "no_handle",
        parse_before = "trim",
    },
    preset = {
        output = {
            split = {
                min_size = 8
            }
        }
    }
}

require("translate").setup(options)


-- nightfox

-- Default options
require('nightfox').setup({
  options = {
    -- Compiled file's destination location
    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
    compile_file_suffix = "_compiled", -- Compiled file suffix
    transparent = false,    -- Disable setting background
    terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
    dim_inactive = false,   -- Non focused panes set to alternative background
    styles = {              -- Style to be applied to different syntax groups
      comments = "NONE",    -- Value is any valid attr-list value `:help attr-list`
      functions = "NONE",
      keywords = "NONE",
      numbers = "NONE",
      strings = "NONE",
      types = "NONE",
      variables = "NONE",
    },
    inverse = {             -- Inverse highlight for different types
      match_paren = false,
      visual = false,
      search = false,
    },
    modules = {             -- List of various plugins and additional options
      -- ...
    },
  }
})

-- dark: nightfox, duskfox, nordfox, terafox
-- light: dayfox, dawnfox,
vim.cmd("colorscheme dayfox")


-- hop 
require'hop'.setup()
-- end 
EOF

nnoremap <leader>u :wa<Enter>
nnoremap <esc><esc> :noh<return><esc>
nnoremap <leader>bn :bnext<enter>
nnoremap <leader>bu :bprevious<enter>
nnoremap <leader>dd :bdelete<enter>

" Theme
"colorscheme dracula 
"colorscheme catppuccin 

"hi Normal guibg=NONE ctermbg=NONE

source ~/.config/nvim/plugins/text-expender.vim
