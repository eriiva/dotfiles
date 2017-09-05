if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'altercation/vim-colors-solarized'
Plug '~/.nix-profile/share/vim-plugins/fzf'
Plug '~/.nix-profile/share/vim-plugins/fzf-vim'
call plug#end()

"colorscheme elflord
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
