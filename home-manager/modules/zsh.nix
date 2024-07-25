{ config, pkgs, ... }: {
  programs.zsh = {
    enable = true;

    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

    shellAliases =
      let
        flakeDir = "~/nixos-config";
      in {
      rb = "sudo nixos-rebuild switch --flake ${flakeDir}";
      upd = "nix flake update ${flakeDir}";
      upg = "sudo nixos-rebuild switch --upgrade --flake ${flakeDir}";
      hms = "home-manager switch --flake ${flakeDir}";
      conf = "nvim ${flakeDir}/nixos/configuration.nix";
      pkgs = "nvim ${flakeDir}/nixos/packages.nix";

      ll = "ls -l";

      ls = "eza --icons=always --color=always";
    };

    history = {
      size = 5000;
      save = 5000;
      path = "${config.xdg.dataHome}/zsh/history";
      ignoreDups = true;
      ignoreSpace = true;
      expireDuplicatesFirst = true;
      share = true;
    };

    plugins = [
      {
        name = "zsh-fzf-tab";
        src = pkgs.zsh-fzf-tab;
      }

      {
        name = "wakatime-zsh-plugin";
        src = pkgs.fetchFromGitHub {
          owner = "sobolevn";
          repo = "wakatime-zsh-plugin";
          rev = "0.1.0";
          sha256 = "0yxijlsyvryx888jvlk02axkv5cag6mjk7fjn08wwyv9y6hpf6cq";
        };
      }
    ];

    initExtra = ''
      # enable zoxide with cd alias
      eval "$(zoxide init --cmd cd zsh)"

      # fzf keybindings and fuzzy completion
      eval "$(fzf --zsh)"

      # fzf-tab
      source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh

      # use fd for fzf
      export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
      export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
      export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

      # use fd (https://github.com/sharkdp/fd) for listing path candidates.
      # - The first argument to the function ($1) is the base path to start traversal
      # - See the source code (completion.{bash,zsh}) for the details.
      _fzf_compgen_path() {
        fd --hidden --exclude .git . "$1"
      }

      # use fd to generate the list for directory completion
      _fzf_compgen_dir() {
        fd --type=d --hidden --exclude .git . "$1"
      }

      # fzf previews
      show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always --icons=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

      export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
      export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

      # advanced customization of fzf options via _fzf_comprun function
      # - the first argument to the function is the name of the command.
      # - you should make sure to pass the rest of the arguments to fzf.
      _fzf_comprun() {
        local command=$1
        shift

        case "$command" in
          cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
          export|unset) fzf --preview "eval 'echo \$${}'"         "$@" ;;
          ssh)          fzf --preview 'dig {}'                   "$@" ;;
          *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
        esac
      }

      # FZF-tab preview commands
      zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
      zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'
    '';

    completionInit = ''
      autoload -U compinit && compinit

      # Completion styling
      zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
      zstyle ':completion:*' list-colors "''${(s.:.)LS_COLORS}"
      zstyle ':completion:*' menu no
    '';
  };
}