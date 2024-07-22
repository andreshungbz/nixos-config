{ pkgs, ... }: {
  users = {
    users.andreshung = {
      isNormalUser = true;
      description = "Andres Hung";
      extraGroups = [ "networkmanager" "wheel" "openrazer" ];
      packages = with pkgs; [];
    };
  };
}