let
  misc = { pkgs, ... }: {
    programs = {
      gpg.enable = true;
      ssh.enable = true;
    }; 
  };

in
[
  ./git
  ./nvim
  misc
]
