{ config, lib, pkgs, inputs, ... }:

{
  nix = {
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    package = pkgs.nixVersions.unstable;
    registry.nixpkgs.flake = inputs.nixpkgs;

    settings = {
      auto-optimise-store = true;
      experimental-features = [ "nix-command" "flakes" ];

      #keep-outputs = true;
      #keep-derivations = true;
    };
  }; 
}
