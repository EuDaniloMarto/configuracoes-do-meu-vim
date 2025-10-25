" --- VIMRC --- "

" --- Autor: Danilo Marto de Carvalho <carvalho.dm@proton.me> --- "
" --- Descrição: Customizei o VIM-Bootstrap para meu uso  --- "
" --- Font: https://vim-bootstrap.com/ --- "

" --- Vim-Plug Core --- "
let vimplug_exists=expand('~/.vim/autoload/plug.vim')
let curl_exists=expand('curl')

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"

  autocmd VimEnter * PlugInstall
endif

" --- Plug Install Packages --- "
call plug#begin(expand('~/.vim/plugged'))
Plug 'severij/vadelma'
Plug 'itchyny/lightline.vim'             " Barra de status customizável
Plug 'luochen1990/rainbow'               " Colorir pares de colchetes e parênteses
Plug 'preservim/nerdtree'                " Árvore de diretórios
Plug 'preservim/tagbar'                  " Exibição de tags (estrutura do código)
Plug 'tpope/vim-commentary'              " Comentar linhas de código facilmente
Plug 'raimondi/delimitmate'              " Fechamento automático de pares de delimitadores
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " Fuzzy finder (fzf)
Plug 'junegunn/fzf.vim'                               " Integração do fzf com o Vim
Plug 'editorconfig/editorconfig-vim'      " Suporte ao EditorConfig
Plug 'jelera/vim-javascript-syntax'       " Sintaxe JavaScript aprimorada
Plug 'leafOfTree/vim-svelte-plugin'       " Suporte à sintaxe Svelte
Plug 'posva/vim-vue'                      " Sintaxe para Vue.js
Plug 'leafOfTree/vim-vue-plugin'          " Suporte ao desenvolvimento com Vue.js
Plug 'vim-scripts/c.vim', {'for': ['c', 'cpp']}
Plug 'ludwig/split-manpage.vim'
Plug 'fatih/vim-go', {'do': ':GoInstallBinaries'}
Plug 'racer-rust/vim-racer'               " Autocompletar para Rust
Plug 'rust-lang/rust.vim'                 " Suporte à sintaxe Rust
Plug 'mattn/emmet-vim'
Plug 'jelera/vim-javascript-syntax'

Plug 'mattn/emmet-vim'                    " Emmet para HTML e CSS
Plug 'tpope/vim-endwise'                  " Adiciona automaticamente 'end' para blocos
Plug 'prabirshrestha/async.vim'           " Base para operações assíncronas no Vim
Plug 'prabirshrestha/vim-lsp'             " Suporte básico para LSP (Language Server Protocol)
Plug 'prabirshrestha/asyncomplete.vim'    " Autocomplete assíncrono
Plug 'prabirshrestha/asyncomplete-lsp.vim'" Integração do LSP com o asyncomplete
Plug 'dense-analysis/ale'                 " Linter e fixer de código em tempo real
" Suporte a CoC (Conquer of Completion) para autocompletar
Plug 'neoclide/coc.nvim', {'branch': 'release'}  " Autocompletar baseado no LSP
" Finaliza a configuração de plugins
call plug#end()

" --- --- "
" --- Geral --- "

" Ativa o suporte a plugins, indentação e tipos de arquivo
filetype plugin indent on

" Configurações gerais de edição
set nobackup                       " Não cria arquivos de backup
set noswapfile                     " Desativa o uso de swapfiles
set history=256                    " Aumenta o histórico de comandos
set encoding=utf-8                 " Define o encoding como UTF-8
set fileencoding=utf-8             " Define o encoding de arquivos como UTF-8
set fileencodings=utf-8            " Prioriza UTF-8 ao abrir arquivos
set ttyfast                        " Otimiza para terminais rápidos
set hidden                         " Permite mudar de buffer sem salvar
set autoread                       " Atualiza automaticamente arquivos modificados externamente
set wildmenu                       " Melhora a interface de autocompletar no modo comando

" --- Aparência --- "

" Ativa a sintaxe e define o esquema de cores
syntax on
colorscheme vadelma

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

" --- Editor --- "

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

" --- Comandos --- "

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

" --- Auto Comandos --- "

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

" --- Mapeamento --- "

" Define o líder do mapeamento
let mapleader=','

" Abreviações de comandos na linha de comando
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Configurações do NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules', '\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent = '<RightMouse>'
let g:NERDTreeWinSize = 50

" Ignora arquivos e diretórios específicos durante a busca
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,*node_modules/
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__

" Mapeamentos para NERDTree e Tagbar
nnoremap <silent> <F2> :NERDTreeFind<CR>
nnoremap <silent> <F3> :NERDTreeToggle<CR>
nnoremap <F4> :TagbarToggle<CR>

" Comando FZF para busca
let $FZF_DEFAULT_COMMAND = "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o -type f -print -o -type l -print 2> /dev/null"

" Configura o FZF para usar 'ag' (The Silver Searcher) caso esteja disponível
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor  " Define 'ag' como ferramenta de grep
endif

" Configura o FZF para usar 'rg' (ripgrep) se estiver disponível, preferindo 'rg' a 'ag'
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep  " Define 'rg' como ferramenta de grep

  " Comando personalizado 'Find' para procurar arquivos e conteúdo
  command! -bang -nargs=* Find call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.
  \ shellescape(<q-args>). '| tr -d "\017"',
  \ 1, <bang>0)
endif

" Mapeamentos para divisão de janelas
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Navegação entre guias
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <leader><Tab> :tabnew<CR>

" Navegação entre buffers
noremap <leader>q :bp<CR>      " Navegar para o buffer anterior
noremap <leader>w :bn<CR>      " Navegar para o próximo buffer
noremap <leader>c :bd<CR>      " Fechar o buffer atual

" Limpa a pesquisa visualmente
nnoremap <silent> <leader><space> :noh<cr>

" Navegação entre janelas
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Manter seleção ao recuar ou avançar no modo visual
vmap < <gv
vmap > >gv

" --- COC --- "

" --- Configurações básicas ---

" Definir a codificação para UTF-8
set encoding=utf-8

" Configurações para evitar arquivos de backup
set nobackup
set nowritebackup

" Tempo de atualização para evitar atrasos
set updatetime=300

" --- Exibir coluna de sinais ---

" Sempre mostrar a coluna de sinais
" Isso evita que o texto seja deslocado quando os diagnósticos aparecem
" set signcolumn=yes

" --- Mapeamentos para completions ---

" Use TAB para completar e navegar entre as opções
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Navegação entre as opções de completamento
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Aceitar item de conclusão ou formatar
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() :
                              "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Função para verificar se a tecla de backspace deve ser usada
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Ativar a conclusão com Ctrl-Space
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" --- Navegação de diagnósticos ---

" Mapeamentos para navegar entre os diagnósticos
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" --- Navegação de código ---

" Navegação para definição, tipos, implementação e referências
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Mostrar documentação na janela de pré-visualização
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Destacar símbolo e referências ao segurar o cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" --- Renomeação de símbolos ---

" Renomear símbolos com mapeamento
nmap <leader>rn <Plug>(coc-rename)

" --- Formatação de código selecionado ---

" Formatar código selecionado
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" --- Agrupamento de autocmds ---

augroup mygroup
  autocmd!
  " Configura formatexpr para tipos de arquivo específicos
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Atualiza a ajuda de assinatura ao pular o espaço reservado
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" --- Ações de código ---

" Aplicar ações de código selecionadas
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Aplicar ações de código na posição do cursor
nmap <leader>ac <Plug>(coc-codeaction-cursor)

" Aplicar ações de código que afetam todo o buffer
nmap <leader>as <Plug>(coc-codeaction-source)

" Aplicar a ação de quickfix mais preferida
nmap <leader>qf <Plug>(coc-fix-current)

" --- Remapeamentos de refatoração ---

" Aplicar ações de refatoração
nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

" --- Ação de Code Lens ---

" Executar ação de Code Lens na linha atual
nmap <leader>cl <Plug>(coc-codelens-action)

" --- Mapeamentos de objetos de função e classe ---

" Mapeamentos para objetos de função e classe
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" --- Rolagem em janelas flutuantes ---

" Remapeamentos para rolar em janelas flutuantes
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" --- Seleções de intervalo ---

" Usar Ctrl-S para seleções de intervalo
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" --- Comandos personalizados ---

" Comando para formatar o buffer atual
command! -nargs=0 Format :call CocActionAsync('format')

" Comando para dobrar o buffer atual
command! -nargs=? Fold :call CocAction('fold', <f-args>)

" Comando para organizar as importações do buffer atual
command! -nargs=0 OR   :call CocActionAsync('runCommand', 'editor.action.organizeImport')

" --- Suporte à linha de status ---

" Adicionar suporte à linha de status nativa do (Neo)Vim
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" --- Mapeamentos para CoCList ---

" Mostrar todos os diagnósticos
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Gerenciar extensões
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Mostrar comandos
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Encontrar símbolos do documento atual
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Pesquisar símbolos do workspace
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Ação padrão para o próximo item
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Ação padrão para o item anterior
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Retomar a última lista do coc
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
