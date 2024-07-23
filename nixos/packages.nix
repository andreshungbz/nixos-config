# Main Desktop Packages

{ pkgs, ... }: {
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = with pkgs; [
    # desktop applications
    firefox
    firefox-devedition
    thunderbird
    telegram-desktop
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
    openssl
    wakatime-cli
    npm-check-updates
    eza
    zoxide
    bat
    fzf

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

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
