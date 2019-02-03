if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif
call plug#begin()
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'ntpeters/vim-better-whitespace'
Plug 'Yggdroot/indentLine'
Plug 'kergoth/vim-bitbake'
Plug 'LnL7/vim-nix'
Plug 'calincru/qml.vim'
Plug 'aklt/plantuml-syntax'
Plug 'mfukar/robotframework-vim'
Plug '~/.nix-profile/share/vim-plugins/fzf'
Plug '~/.nix-profile/share/vim-plugins/fzf-vim'
Plug '~/.nix-profile/share/vim-plugins/LanguageClient-neovim'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
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

xnoremap p "_dP

set mouse=a

set background=dark
colorscheme solarized

let g:LanguageClient_serverCommands = {
            \ 'cpp': ['cquery'],
            \ 'c': ['cquery']
            \ }

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
