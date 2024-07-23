let 
  folder = ./modules;
in 
{
  imports = [
    "${folder}/bash.nix"
    "${folder}/git.nix"
    "${folder}/kitty.nix"
    "${folder}/starship.nix"
    "${folder}/zsh.nix"
  ];
}