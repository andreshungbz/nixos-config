{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.90;

        dimensions = {
          lines = 40;
          columns = 150;
        };
      };

      font = {
        size = 11.0;
        normal = {
          family = "JetBrainsMono Nerd Font";
        };
      };

      colors.primary.background = "#1d2021";
    };
  };
}