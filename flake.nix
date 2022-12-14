{
  description = "Dotfiles Flake";
  
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nurpkgs.url = github:nix-community/NUR;
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config = { allowUnfree = false; };
      };
    in {
      homeConfigurations = {
        ab = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/home.nix ];
        };
      };

      nixosConfigurations = {
        laptop = nixpkgs.lib.nixosSystem {
          inherit pkgs;

          modules = [
            ./system/hosts/laptop
            ./system/configuration.nix
          ];
        };
      };
    };
}
