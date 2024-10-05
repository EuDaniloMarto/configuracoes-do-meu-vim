" Inicia a configuração de plugins usando vim-plug
call plug#begin(g:plugged_dir)

" Interface e aparência
Plug 'itchyny/lightline.vim'             " Barra de status customizável
Plug 'luochen1990/rainbow'               " Colorir pares de colchetes e parênteses

" Navegação e código
Plug 'preservim/nerdtree'                " Árvore de diretórios
Plug 'preservim/tagbar'                  " Exibição de tags (estrutura do código)
Plug 'tpope/vim-commentary'              " Comentar linhas de código facilmente
Plug 'raimondi/delimitmate'              " Fechamento automático de pares de delimitadores

" Ferramentas de busca e navegação
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }   " Fuzzy finder (fzf)
Plug 'junegunn/fzf.vim'                               " Integração do fzf com o Vim

" Padronização de arquivos e sintaxe
Plug 'editorconfig/editorconfig-vim'      " Suporte ao EditorConfig
Plug 'jelera/vim-javascript-syntax'       " Sintaxe JavaScript aprimorada
Plug 'leafOfTree/vim-svelte-plugin'       " Suporte à sintaxe Svelte
Plug 'posva/vim-vue'                      " Sintaxe para Vue.js
Plug 'leafOfTree/vim-vue-plugin'          " Suporte ao desenvolvimento com Vue.js

" Suporte a Rust
Plug 'racer-rust/vim-racer'               " Autocompletar para Rust
Plug 'rust-lang/rust.vim'                 " Suporte à sintaxe Rust

" Ferramentas para edição
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
