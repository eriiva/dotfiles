autoload -U promptinit
promptinit

autoload -U compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export NIX_PATH="nixpkgs=$HOME/.nix-defexpr/channels/nixpkgs:nixos-config=/etc/nixos/configuration.nix:/nix/var/nix/profiles/per-user/root/channels"
