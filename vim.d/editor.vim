" Configurações de backspace
set backspace=indent,eol,start  " Permite usar backspace em indentação, fim de linha e início da edição

" Configurações de tabulação e indentação
set tabstop=4                   " Define o número de espaços para cada tabulação
set softtabstop=0               " Usa o valor de 'tabstop' para calcular a tabulação no modo de inserção
set shiftwidth=4                " Define o número de espaços para cada nível de indentação
set expandtab                   " Converte tabs em espaços
set autoindent                  " Mantém a indentação da linha anterior
set smartindent                 " Indenta automaticamente de acordo com a sintaxe

" Configurações de busca
set hlsearch                    " Realça todas as ocorrências da pesquisa
set incsearch                   " Mostra resultados de pesquisa enquanto digita
set ignorecase                  " Ignora maiúsculas/minúsculas ao buscar
set smartcase                   " Diferencia maiúsculas/minúsculas se houver maiúsculas na busca

" Outras opções gerais
set nowrap                      " Não quebra linhas automaticamente

" Configurações do ALE (Asynchronous Lint Engine)
let g:ale_fix_on_save = 1
let g:ale_fixers = {
  \ '*': [
    \ 'remove_trailing_lines',
    \ 'trim_whitespace'
  \]
\}
