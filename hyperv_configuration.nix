{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/local-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "hv_vmbus" "hv_storvsc" ];
  boot.kernelParams = [ "consoleblank=0" "elevator=noop" "clocksource=tsc" "possible_cpus=2" ];

  fileSystems."/".options = [ "noatime" "nodiratime" ];

  swapDevices = [{ device = "/var/swapfile"; size = 2048; } ];

  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "sv-latin1";
    defaultLocale = "en_US.UTF-8";
  };

  time.timeZone = "Europe/Amsterdam";

  environment.systemPackages = with pkgs; [ git ];

  security.sudo.wheelNeedsPassword = false;

  services.openssh.enable = true;
  services.openssh.forwardX11 = true;
  services.openssh.permitRootLogin = "no";

  #programs.fish.enable = true;
  #users.defaultUserShell = pkgs.fish;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

  networking.firewall.enable = false;
  networking.enableIPv6 = false;
  networking.interfaces.eth1.ipv4.addresses = [{ address = "10.0.0.2"; prefixLength = 24; }];

  system.stateVersion = "18.03";
}
