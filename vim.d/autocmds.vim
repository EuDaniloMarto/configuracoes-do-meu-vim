" Sincronização de sintaxe para arquivos grandes, limitando o número de linhas processadas
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200  " Sincroniza a sintaxe com um máximo de 200 linhas
augroup END

" Lembra a posição do cursor ao reabrir arquivos
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" Configuração de quebra de linha automática para arquivos de texto (.txt)
augroup vimrc-wrapping
    autocmd!
    autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
