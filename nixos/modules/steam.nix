{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # open ports in the firewall for Steam Local Network Game Transfers
  };
}