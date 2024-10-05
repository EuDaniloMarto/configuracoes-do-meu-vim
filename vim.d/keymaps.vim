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
