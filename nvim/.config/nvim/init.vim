if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
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
set ruler

let mapleader = " "
let g:mapleader = " "
map <leader>c :Commands<cr>
map <leader>f :Ag 
map <leader>o :Files<cr>
map <leader>b :Buffers<cr>
map <leader>g :BCommits<cr>
map <leader>n :nohls<cr>
map <F2> :NERDTreeToggle<cr>
map <F3> :NERDTreeFind<cr>
map <F4> :TagbarToggle<cr>
