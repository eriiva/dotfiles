{
  packageOverrides = pkgs_: with pkgs_; {
    all = buildEnv {
      name = "all";
      paths = [
        (neovim.override { vimAlias=true; }) ctags fzf silver-searcher vimPlugins.fzfWrapper vimPlugins.fzf-vim
      ];
    };
  };
}
