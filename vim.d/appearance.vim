" Ativa a sintaxe e define o esquema de cores
syntax on
colorscheme default

" Configurações da interface
set cmdheight=2            " Define a altura da linha de comando para 2 linhas
set showcmd                " Mostra o comando atual na barra de status
set ruler                  " Mostra a posição do cursor
set number                 " Exibe números de linha
set scrolloff=3            " Mantém 3 linhas visíveis ao rolar a tela
set laststatus=2           " Sempre mostra a barra de status

" Configurações de divisão de janelas
set splitright             " Novas janelas verticais à direita
set splitbelow             " Novas janelas horizontais abaixo

" Configurações de títulos
set title                  " Ativa a atualização do título do terminal
set titleold="Terminal"    " Define o título anterior do terminal
set titlestring=%F         " Mostra o nome completo do arquivo no título do terminal

" Configurações de modeline
set modeline               " Ativa modelines (configurações específicas em arquivos)
set modelines=10           " Lê até 10 linhas para buscar modelines

" Ativa o rainbow (cores diferentes para pares de colchetes)
let g:rainbow_active = 1

" Verifica se o terminal suporta cores e ativa a sintaxe colorida
if has("persistent_undo")
  set undofile
  set undodir=~/.vim/undodir
endif

" Evita atualizações desnecessárias na tela durante a execução de macros
set lazyredraw

" Sempre mostrar a coluna de sinais
" Isso evita que o texto seja deslocado quando os diagnósticos aparecem
set signcolumn=yes
