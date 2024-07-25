let 
  folder = ./modules;
in 
{
  imports = [
    "${folder}/bash.nix"
    "${folder}/git.nix"
    "${folder}/starship.nix"
    "${folder}/zsh.nix"
    "${folder}/neovim.nix"
    "${folder}/fastfetch.nix"
  ];
}