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
    warp-terminal

    # desktop utilities
    polychromatic
    mission-center
    psensor
    flameshot

    # desktop extras
    openrazer-daemon

    # coding
    gnumake
    gcc
    nodejs
    python3

    # cli utilities
    vim
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
    fd
    rclone

    # wayland
    xwayland
    wl-clipboard
    wl-clipboard-x11
    cliphist

    # sound
    pipewire
    pulseaudio
    pamixer

    # gpu
    amdvlk
    rocm-opencl-icd
    glaxnimate

    # mDNS
    avahi
    nssmdns
  ];

  fonts.packages = with pkgs; [
    jetbrains-mono
    noto-fonts
    noto-fonts-emoji
    twemoji-color-font
    font-awesome
    powerline-fonts
    powerline-symbols
    ubuntu-sans
    ubuntu-classic
    commit-mono
    (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];
}
