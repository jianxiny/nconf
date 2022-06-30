let mapleader = "\<space>"
map gf :edit <cfile><cr>

call plug#begin()
Plug 'ggandor/lightspeed.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'romgrk/barbar.nvim'
call plug#end()
lua << EOF

