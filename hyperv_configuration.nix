{ config, pkgs, ... }:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    /etc/nixos/local-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.initrd.kernelModules = [ "hv_vmbus" "hv_storvsc" ];

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

  programs.fish.enable = true;
  users.defaultUserShell = pkgs.fish;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  networking.firewall.enable = false;
  networking.enableIPv6 = false;

  sound.enable = false;

  # Enable the X11 windowing system.
  #services.xserver.enable = true;
  #services.xserver.layout = "se";
  #services.xserver.windowManager.openbox.enable = true;

  system.stateVersion = "17.09";
}
