" Comando para remover espaços em branco ao final de cada linha
command! FixWhitespace :%s/\s\+$//e

" Configuração para a quebra de linhas automática, evitando redefinições desnecessárias
if !exists('*s:setupWrapping')
    function! s:setupWrapping()
      set wrap                   " Ativa a quebra automática de linhas
      set wm=2                   " Define margem de 2 caracteres
      set textwidth=79           " Define o limite de 79 caracteres por linha
    endfunction
endif
