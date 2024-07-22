{
  programs.git = {
    enable = true;

    userName  = "Andres Hung";
    userEmail = "andres.hung@outlook.com";

    aliases = {
      unstage = "restore --staged";
      last = "log -1 HEAD";
    };

    extraConfig = {
      init = {
        defaultBranch = "main";
      };
      core = {
        autocrlf = "input";
        editor = "vim";
      };
      pull = {
        rebase = "false";
      };
    };
  };
}