if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'altercation/vim-colors-solarized'
Plug 'LnL7/vim-nix'
Plug '~/.nix-profile/share/vim-plugins/fzf'
Plug '~/.nix-profile/share/vim-plugins/fzf-vim'
Plug '~/.nix-profile/share/vim-plugins/youcompleteme'
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
"map <F4> :TagbarToggle<cr>

set mouse=a

set background=dark
colorscheme solarized

let g:ycm_server_python_interpreter = expand('~/.nix-profile/bin/nvim-python')
