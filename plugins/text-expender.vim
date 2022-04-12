" auto cmd 
autocmd FileType vue,javascriptreact,javascript,typescriptreact,typescript setlocal ts=2 sts=2 sw=2
" fzf 
nnoremap <silent> <Leader>b :Buffers<CR>
nnoremap <silent> <Leader>r :Files<CR>
nnoremap <silent> <Leader>ff :Rg<CR>
nnoremap <silent> <Leader>/ :BLines<CR>
nnoremap <silent> <Leader>' :Marks<CR>
nnoremap <silent> <Leader>g :Commits<CR>
nnoremap <silent> <Leader>H :Helptags<CR>
nnoremap <silent> <Leader>hh :History<CR>
nnoremap <silent> <Leader>h: :History:<CR>
nnoremap <silent> <Leader>h/ :History/<CR>

" hop 
"
nnoremap <silent> <Leader>tj :HopChar1<CR>


nnoremap <silent> <Leader>jr <C-w>x<CR>

nnoremap <silent> <Leader>tt :<C-u>Translate ZH -source=EN -output=floating<CR>
xnoremap <silent> <Leader>tt :Translate ZH -source=EN -output=floating<CR>
autocmd BufWritePost $MYVIMRC source $MYVIMRC
nnoremap <silent> <Leader>ee $
"nvim-tree 
nnoremap <silent> <leader>v :NvimTreeToggle<CR>

nnoremap <silent> <Leader><Leader> :
inoremap ff x

inoremap jj .
inoremap tj :
inoremap jt _

inoremap mr ""<left>


inoremap jf <ESC>
inoremap fj <ESC>o
inoremap ;; <ESC>f)a;
inoremap ,, <right>,

inoremap jg <ESC>$a{<Enter>}<ESC>O
inoremap fh []<left>
inoremap hf {}<left>
inoremap gj ()<left>
inoremap uf <><left>

inoremap 33 #
inoremap 11 !
inoremap 22 @
inoremap 44 $
inoremap 55 %
inoremap 77 &
inoremap 88 *
inoremap rtn return 

inoremap ;e =
inoremap ;ge <right>>=
inoremap ;le <right><=


"js 
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ee === 

autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ne !== 
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ir import<space><space>from ''<Esc>Fta<space>

autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;rt export<space>
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;t const<space>
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> vn <right>=>
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;gg console.log('')<left><left>
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ther throw<space>new<space>Error("")

autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;utt const<space>[] = useState()<Esc>F[a
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;uft useEf<space><C-h>fect(() => {}, [])<Esc>F}i
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ubk useCallback(() => {}, [])<Esc>F}i
autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;upa const [searchParams, setSearchParams] = useSearchParams()
"go
autocmd Filetype go inoremap <buffer> hh if err != nil {<Enter>}<ESC>klla <ESC>ha
autocmd Filetype go inoremap <buffer> fg for , v := range <ESC>^4li
autocmd Filetype go inoremap vn <-
autocmd Filetype go inoremap vnn type<space><space>struct<space>{<Enter>}<ESC>k05li<space><space><left>
autocmd Filetype go inoremap vnv ->
autocmd Filetype go inoremap nvv type<space><space>interface<space>{<Enter>}<ESC>k05li<space><space><left>
autocmd Filetype go inoremap ein errors.New("")<left><left>
autocmd Filetype go inoremap eii errors.Is()<left>


autocmd Filetype go inoremap fn func<space>()<ESC>$a{<Enter>}<ESC>k^ea<space>
autocmd Filetype go inoremap ftef fmt.Errorf("")<left><left>
autocmd Filetype go inoremap iee switch{<enter>}<esc>kea<space>
autocmd Filetype go inoremap uee case<space>:<left><space><left>


inoremap <C-j> <ESC>$a
