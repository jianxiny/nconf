inoremap jr <Esc>:
inoremap jj .
inoremap tj :
inoremap jt _

inoremap kd ""<left>
inoremap dk <right>


inoremap jf <ESC>
"inoremap df <ESC>
inoremap fj <ESC>o
inoremap ,, <right>,


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
inoremap <C-j> <ESC>$a

augroup text_expender
    autocmd!
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;t const<space>
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;rt export<space>
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ir import<space><space>from ''<Esc>Fta<space>
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> vn <right>=>
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;gg console.log('')<left><left>
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ther throw<space>new<space>Error("")
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;e =
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ee ===
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript inoremap <buffer> ;ne !==
augroup END
