autoload -U promptinit
promptinit

autoload -U compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NIX_PATH="nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels"

export LOCALE_ARCHIVE_2_27="/nix/store/d8idjvppibl92jmi9zqswp8cw3w022l0-glibc-locales-2.27/lib/locale/locale-archive"

eval $(dircolors $(dirname $(readlink -f ${(%):-%x}))/dircolors.256dark)
