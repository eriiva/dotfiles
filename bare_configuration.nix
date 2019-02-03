{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/local-configuration.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    timeout = 0;
  };
  boot.plymouth.enable = true;

  fileSystems."/".options = [ "noatime" "nodiratime" ];

  i18n = {
    consoleFont = "latarsyrheb-sun32";
    consoleKeyMap = "sv-latin1";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Amsterdam";

  environment.systemPackages = with pkgs; [ git ];

  security.sudo.wheelNeedsPassword = false;

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  networking.enableIPv6 = false;
  networking.dhcpcd.enable = false;

  services.xserver = {
    enable = true;
    layout = "se";
    xkbOptions = "eurosign:e";
    dpi = 140;
    windowManager.i3.enable = true;
    desktopManager.xfce.enable = true;
    displayManager.lightdm = {
      enable = true;
      extraSeatDefaults = ''
        allow-guest = false
        greeter-hide-users = true
        greeter-show-manual-login = true
      '';
      greeters.gtk.theme.name = "Xfce-flat";
      greeters.gtk.indicators = [];
      greeters.gtk.extraConfig = ''
        xft-dpi = 160
        cursor-theme-name = Adwaita
        cursor-theme-size = 32
      '';
    };
  };

  services.compton = {
    enable = true;
    fade = true;
    inactiveOpacity = "0.9";
    shadow = true;
    fadeDelta = 4;
  };

  system.stateVersion = "18.09";
}
