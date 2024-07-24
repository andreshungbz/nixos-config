{ pkgs, ... }: {
  programs.zsh.enable = true;

  users = {
    defaultUserShell = pkgs.zsh;

    users.andreshung = {
      isNormalUser = true;
      description = "Andres Hung";
      extraGroups = [ "networkmanager" "wheel" "openrazer" ];
      packages = with pkgs; [];

      openssh.authorizedKeys.keys = [
        # AHM1A public key
        "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILJnxpZPkVqAi7XNIezGn8sZ4vC8pbIGr98um7Ax8ARO andres.hung@outlook.com"
      ];
    };
  };
}