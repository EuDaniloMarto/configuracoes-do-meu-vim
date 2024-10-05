" Verifica se o 'curl' está instalado
if !executable('curl')
    echoerr 'You have to install curl or first install vim-plug manually!'
    execute 'q!'
  endif

  " Instalação do Vim-Plug
  echo 'Installing Vim-Plug...'
  silent! execute '!curl -fLo ' . shellescape(g:vimplug_path) . ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

  " Instala os plugins automaticamente ao abrir o Vim
  autocmd VimEnter * PlugInstall
