{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {
    base = buildEnv {
      name = "base";
      paths = [
        (neovim.override { vimAlias=true; }) fzf silver-searcher bear vimPlugins.fzfWrapper vimPlugins.fzf-vim vimPlugins.YouCompleteMe
        file
      ];
    };
    desktop = buildEnv {
      name = "desktop";
      paths = [
        firefox wireshark
      ];
    };
  };
}
