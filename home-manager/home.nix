{
  imports = [
    ./modules/bundle.nix
  ];

  home = {
    username = "andreshung";
    homeDirectory = "/home/andreshung";
    stateVersion = "24.05";
  };

  programs.home-manager.enable = true;
}