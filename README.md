# NixOS Configuration

This repository contains the configuration files for my NixOS system. It utilizes Flakes and Home Manager.

The initial structure was based on [this repository](https://github.com/Andrey0189/nixos-config).

## New Installation

```
sudo mv /etc/nixos /etc/nixos.bak  # Backup the original configuration
git clone https://github.com/andreshungbz/dotfiles.git
sudo ln -s ~/nixos-config/ /etc/nixos

sudo nixos-rebuild switch
```

Creating a symbolic link eliminates the need for the `--flake` option when rebuilding.

## Useful Nix Commands

Rebuild the system and immediately switch to the new configuration:

```
sudo nixos-rebuild switch
```

Update the flake lock file:

```
nix flake update
```

Collect garbage:

```
sudo nix-collect-garbage --delete-old
```
