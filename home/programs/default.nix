let
  misc = { pkgs, ... }: {
    programs = {
      gpg.enable = true;
      ssh.enable = true;
    }; 
  };

in
[
  ./browsers/firefox.nix
  ./git
  ./nvim
  misc
]
