augroup vue_expender
    autocmd!
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> vuen <template><CR>hello<CR></template><CR><script lang="ts" setup><CR></script><CR><style scoped><CR></style>
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> ccentern display: flex;<CR>justify-content: center;<CR>align-items:center;
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> dpns const props = defineProps<Props>();
    autocmd Filetype vue,javascriptreact,javascript,typescriptreact,typescript iab <buffer> dens const emit = defineEmits(["change"]);
augroup END
