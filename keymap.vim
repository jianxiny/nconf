nnoremap <leader><leader> <esc>:

nnoremap <leader>u :wa<Enter>
nnoremap <esc><esc> :noh<return><esc>

"nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap ;; <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

"nvim-tree 
nnoremap <A-1> :NvimTreeToggle<CR>


"barbar 
" Move to previous/next
nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
nnoremap <silent>    <leader>dd <Cmd>BufferClose<CR>
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
