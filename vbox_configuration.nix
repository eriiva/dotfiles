# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports = [ /etc/nixos/hardware-configuration.nix ];

  # Use the GRUB 2 boot loader.
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  boot.loader.grub.gfxmodeBios = "1152x864";
  boot.loader.grub.extraConfig = "set gfxpayload=keep";
  boot.kernelParams = [ "nomodeset" "consoleblank=0" ];
  boot.initrd.checkJournalingFS = false;

  networking.hostName = "nixos"; # Define your hostname.
  networking.enableIPv6 = false;
  #networking.firewall.allowedTCPPorts = [ 80 ];

  # Select internationalisation properties.
  i18n = { consoleKeyMap = "sv-latin1"; };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [ git ];
  environment.noXlibs = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.eriiva = {
    isNormalUser = true;
    extraGroups = [ "wheel" "vboxsf" "video" ];
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "17.03";

  security.sudo.wheelNeedsPassword = false;
  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;
  services.mingetty.autologinUser = "eriiva";
  #services.kmscon.enable = true;
  #services.kmscon.hwRender = true;

  #services.httpd.enable = true;
  #services.httpd.enableUserDir = true;
  #services.httpd.adminAddr = "eriiva@outlook.com";
  #services.httpd.maxClients = 1;
  #services.httpd.enablePHP = true;
  #services.httpd.extraConfig = "DirectoryIndex index.php";

  #services.mysql.enable = true;
  #services.mysql.package = pkgs.mysql;
}
