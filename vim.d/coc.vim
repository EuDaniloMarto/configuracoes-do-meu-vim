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
