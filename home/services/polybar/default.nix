{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    font-awesome
    material-design-icons
  ];

  services.polybar = {
    enable = true;
    config = ./config.ini;
    script = ''
      polybar 
    '';
  };
}
