" --- Habilitar suporte a DOM, HTML e CSS para JavaScript ---
let g:javascript_enable_domhtmlcss = 1

" --- Configurações de indentação ---
set tabstop=2          " Define o número de espaços que um TAB representa
set shiftwidth=2       " Define o número de espaços para operações de indentação
set softtabstop=2      " Define o número de espaços que um TAB insere na inserção

" --- Configuração do ALE (Asynchronous Lint Engine) ---

" Definir linters para o buffer atual
let b:ale_linters = [
    \ 'eslint',
\]

" Definir fixers para o buffer atual
let b:ale_fixers = [
    \ 'prettier',
\]
