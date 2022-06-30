set cursorline
set hidden
set signcolumn=yes
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
set updatetime=300 " Reduce time for highlighting other references
set redrawtime=10000 " Allow more time for loading syntax on large files
set ma
set foldnestmax=10 
set nofoldenable 
set foldlevel=2

set termguicolors


let mapleader = "\<space>"
map gf :edit <cfile><cr>

"--------------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------------


call plug#begin()
Plug 'yianwillis/vimcdoc'
Plug 'ggandor/lightspeed.nvim'
Plug 'norcalli/nvim-colorizer.lua'
" lsp 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"Plug 'hrsh7th/cmp-vsnip'
"Plug 'hrsh7th/vim-vsnip'
Plug 'dcampos/nvim-snippy'
Plug 'dcampos/cmp-snippy'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
"
Plug 'jose-elias-alvarez/null-ls.nvim'

" theme 
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'EdenEast/nightfox.nvim'

"Plug 'github/copilot.vim'
"Plug 'tzachar/cmp-tabnine', { 'do': 'powershell ./install.ps1' }


Plug 'nvim-lua/plenary.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'nvim-treesitter/nvim-treesitter-textobjects'

Plug 'lewis6991/gitsigns.nvim'

Plug 'feline-nvim/feline.nvim'
Plug 'itchyny/lightline.vim'

"Plug 'jose-elias-alvarez/nvim-lsp-ts-utils'

Plug 'numToStr/Comment.nvim'

"Plug 'uga-rosa/translate.nvim'
"Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'romgrk/barbar.nvim'
Plug 'kyazdani42/nvim-tree.lua'
Plug 'sheerun/vim-polyglot'
"Plug 'unblevable/quick-scope'
"Plug 'declancm/cinnamon.nvim'
Plug 'mrjones2014/smart-splits.nvim'
"Plug 'stevearc/aerial.nvim'
Plug 'windwp/nvim-autopairs'
Plug 'windwp/nvim-ts-autotag'

call plug#end()

lua << EOF
require'colorizer'.setup()



-- lsp 
local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        require('snippy').expand_snippet(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ['<Tab>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'snippy' },
--      { name = 'cmp_tabnine'}
    }, {
      { name = 'buffer' },
    })
  })

-- lsp config 
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.format({async = true})<CR>', opts)
  
  -- autocmd: format on save
  if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
      vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = bufnr,
          callback = function()
          vim.lsp.buf.format({bufnr = bufnr})
          end,
          })
      end
end

--local servers = {'tsserver', "gopls", "cssls", 'eslint', 'html', 'jsonls' }
local servers = {"gopls", "cssls", 'eslint', 'html', 'jsonls', 'tsserver' }
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities
}
require'lspconfig'.volar.setup{
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
}
require'lspconfig'.emmet_ls.setup{}
end



-- autopairs 
require('nvim-autopairs').setup{}

-- nvim-tree: file manager
require'nvim-tree'.setup {}

-- catppuccin
local catppuccin = require("catppuccin")
catppuccin.setup({
  transparent_background = false, 
  nvimtree = {
        enabled = true,
  show_root = false,
  transparent_panel = true,
  },
})
--require("feline").setup({
	--components = require('catppuccin.core.integrations.feline'),
--})

-- gitsigns
require("gitsigns").setup(
    {
      signs = {
        add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
    }
)




-- telescope 
local options = {
   defaults = {
      vimgrep_arguments = {
         "rg",
         "--color=never",
         "--no-heading",
         "--with-filename",
         "--line-number",
         "--column",
         "--smart-case",
      },
      prompt_prefix = "   ",
      selection_caret = "  ",
      entry_prefix = "  ",
      initial_mode = "insert",
      selection_strategy = "reset",
      sorting_strategy = "ascending",
      layout_strategy = "horizontal",
      layout_config = {
         horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
         },
         vertical = {
            mirror = false,
         },
         width = 0.87,
         height = 0.80,
         preview_cutoff = 120,
      },
      file_sorter = require("telescope.sorters").get_fuzzy_file,
      file_ignore_patterns = { "node_modules" },
      generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
      path_display = { "truncate" },
      winblend = 0,
      border = {},
      borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      color_devicons = true,
      use_less = true,
      set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
      file_previewer = require("telescope.previewers").vim_buffer_cat.new,
      grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
      qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
      -- Developer configurations: Not meant for general override
      -- buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
   },

   extensions_list = { "themes", "terms" },
}

require'telescope'.setup(options)

-- nvim ts context comment 
require("nvim-treesitter.configs").setup{
  context_commentstring = {
      enable = true
  },
  autotag = {
      enable = true
  }
}

require('Comment').setup()

-- null-ls
require("null-ls").setup({
    sources = {
        require("null-ls").builtins.code_actions.eslint,
        require("null-ls").builtins.formatting.prettier
    },
})
EOF

" Theme
let g:catppuccin_flavour =  "latte" "dusk,latte, frappe, macchiato, mocha
colorscheme catppuccin 
 "colorscheme dayfox 
 "colorscheme dawnfox 

 "colorscheme nightfox 
let g:lightline = {'colorscheme': 'one', 'enable': {'statusline': 1, 'tabline': 0}}


autocmd BufWritePre *.tsx,*.ts,*.jsx,*.js EslintFixAll

"autocmd [group] events pattern [nested] command

source ~/AppData/Local/nvim/keymap.vim
source ~/AppData/Local/nvim/css-expander.vim

source ~/AppData/Local/nvim/expander.vim
source ~/AppData/Local/nvim/vue-expander.vim

set foldmethod=expr 
set foldexpr=nvim_treesitter#foldexpr()
