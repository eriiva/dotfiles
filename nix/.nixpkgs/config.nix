{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {
    all = buildEnv {
      name = "base";
      paths = [
        (neovim.override { vimAlias=true; }) fzf silver-searcher vimPlugins.fzfWrapper vimPlugins.fzf-vim vimPlugins.YouCompleteMe
        file
      ];
    };
  };
}
