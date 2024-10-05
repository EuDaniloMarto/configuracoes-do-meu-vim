let g:basedir = expand('~/.vim/')
let g:vimplug_path = g:basedir . 'autoload/plug.vim'
let g:plugged_dir = g:basedir . 'plugged/'

" Verifica se o vim-plug está instalado
if !filereadable(g:vimplug_path)
  source g:basedir . 'install/vim-plug.vim'
endif

" Lista de configurações a serem carregadas
let g:config_files = [
  \ 'plugins',
  \ 'general',
  \ 'appearance',
  \ 'editor',
  \ 'commands',
  \ 'autocmds',
  \ 'keymaps',
  \ 'coc',
\]

" Carrega cada arquivo de configuração
for config in g:config_files
  let config_path = g:basedir . 'vim.d/' . config . '.vim'
  if filereadable(config_path)
    execute 'source' config_path
  else
    echohl WarningMsg | echom "Config file " . config_path . " not found" | echohl None
  endif
endfor
