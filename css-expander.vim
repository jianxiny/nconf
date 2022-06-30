
augroup css_expender
    autocmd!
    "grid 
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> dng display: grid;
    "flex
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> dnf display: flex;
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> fdnc  flex-direction: column;
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> jcnc  justify-content: center; 
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> ainc  align-items: center;
    "position
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> pna  position: absolute;
augroup END
