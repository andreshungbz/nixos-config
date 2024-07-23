let 
  folder = ./modules;
in 
{
  imports = [
    "${folder}/bluetooth.nix"
    "${folder}/bootloader.nix"
    "${folder}/environment.nix"
    "${folder}/kde-plasma.nix"
    "${folder}/miscellaneous.nix"
    "${folder}/networking.nix"
    "${folder}/sound.nix"
    "${folder}/users.nix"
    "${folder}/xserver.nix"
    "${folder}/steam.nix"
  ];
}