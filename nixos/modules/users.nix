{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.andreshung = {
      isNormalUser = true;
      description = "Andres Hung";
      extraGroups = [ "networkmanager" "wheel" "openrazer" ];
      packages = with pkgs; [];
    };
  };
}