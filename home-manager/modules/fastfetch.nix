{
  programs.fastfetch = {
    enable = true;

    settings = builtins.fromJSON ''
      {
        "$schema": "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json",
        "modules": [
          "title",
          "separator",
          "os",
          "host",
          "kernel",
          "uptime",
          "packages",
          "shell",
          "display",
          "de",
          "wm",
          "terminal",
          "terminalfont",
          "cpu",
          "gpu",
          "memory",
          "swap",
          "disk",
          "battery",
          "localip",
          "datetime",
          "weather",
          "break",
          "colors"
        ]
      }
    '';
  };
}