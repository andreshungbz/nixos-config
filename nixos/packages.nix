# Main Desktop Packages

{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # desktop applications
    chromium
    firefox
    firefox-devedition
    telegram-desktop
    kitty
    obs-studio
    discord
    gparted
    obsidian
    qbittorrent
    krita
    vscode
    vlc

    # desktop utilities
    polychromatic
    mission-center
    psensor

    # desktop extras
    openrazer-daemon

    # coding
    gnumake
    gcc
    nodejs
    python3

    # cli utilities
    vim
    neovim
    file
    tree
    wget
    curl
    git
    fastfetch
    htop
    btop
    ffmpeg
    zip
    zsh
    openssl
    wakatime-cli

    # wayland
    xwayland
    wl-clipboard
    cliphist

    # sound
    pipewire
    pulseaudio
    pamixer

    # gpu
    amdvlk
    rocm-opencl-icd
    glaxnimate
  ];

  # steam
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # open ports in the firewall for Steam Remote Play
    dedicatedServer.openFirewall = true; # open ports in the firewall for Source Dedicated Server
    localNetworkGameTransfers.openFirewall = true; # open ports in the firewall for Steam Local Network Game Transfers
  };

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "NerdFontsSymbolsOnly" ]; })
  ];
}
