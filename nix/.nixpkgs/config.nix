{
  allowUnfree = true;

  packageOverrides = pkgs_: with pkgs_; {
    base = buildEnv {
      name = "base";
      paths = [
        neovim vimPlugins.packer-nvim ccls fzf python310Packages.python-lsp-server
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
