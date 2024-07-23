# System Configuration File

{ inputs, ...}: {
  imports = [
    ./hardware-configuration.nix
    ./packages.nix
    ./bundle.nix
  ];
  
  networking.hostName = "AHNIX-D"; # hostname
  time.timeZone = "America/Belize"; # time zone
  i18n.defaultLocale = "en_US.UTF-8"; # select internationalisation properties
  services.printing.enable = true; # CUPS
  services.openssh.enable = true; # OpenSSH

  nix.settings.experimental-features = [ "nix-command" "flakes" ]; # enable flakes
  home-manager.backupFileExtension = "backup"; # home manager backup

  system.stateVersion = "24.05";
}