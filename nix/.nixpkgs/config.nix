{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {
    base = buildEnv {
      name = "base";
      paths = [
        (neovim.override { vimAlias=true; }) fzf silver-searcher vimPlugins.fzfWrapper vimPlugins.fzf-vim vimPlugins.LanguageClient-neovim cquery
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
