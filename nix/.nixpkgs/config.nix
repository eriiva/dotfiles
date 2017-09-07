{
  packageOverrides = pkgs_: with pkgs_; {
    all = buildEnv {
      name = "base";
      paths = [
        (neovim.override { vimAlias=true; }) ctags fzf silver-searcher vimPlugins.fzfWrapper vimPlugins.fzf-vim
        file
      ];
    };
  };
}
