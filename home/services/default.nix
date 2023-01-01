let
  misc = {
    services = {
      flameshot.enable = true;
      syncthing.enable = true;

      gpg-agent = {
        enable = true;
        enableSshSupport = true;
        pinentryFlavor = "tty";
      };
    };
  };
in
[
  ./polybar
  ./redshift
  misc
]

