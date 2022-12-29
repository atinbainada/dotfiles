{ config, pkgs, ... }:

let
  gitConfig = {
    core = {
      editor = "nvim";
      pager  = "diff-so-fancy | less --tabs=4 -RFX";
    };
    init.defaultBranch = "main";
  };

  rg = "${pkgs.ripgrep}/bin/rg";
in {
  home.packages = with pkgs.gitAndTools; [
    diff-so-fancy
    git-crypt
    tig
  ];

  programs.git = {
    enable = true;
    aliases = {
      loc = "!f(){ git ls-files | ${rg} \"\\.\${1}\" | xargs wc -l;};f";
      br = "branch";
      co = "checkout";
      st = "status";
      cm = "commit -m";
      ca = "commit -am";
    };
    extraConfig = gitConfig;
    signing = {
      key = "FF421192";
      signByDefault = true;
    };
    userEmail = "git@atinb.me";
    userName = "Atin Bainada";
  };
}
