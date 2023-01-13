{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # TODO: Add any other flake you might need
    hardware.url = "github:nixos/nixos-hardware";

    # secret stuff
    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    #  firefox addons
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # hyprland
    #hyprland.url = "github:hyprwm/hyprland";
    #hyprwm-contrib.url = "github:hyprwm/contrib";

    # nvim nächtlicherweise
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

    # wine-ge 
    nix-gaming.url = "github:fufexan/nix-gaming";

    # emcas pgtk
    emacs-overlay.url = "github:nix-community/emacs-overlay";

    # spotify++
    spicetify-nix.url = "github:the-argus/spicetify-nix";

    # minecraft nix-style
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (self) outputs;
      forAllSystems = nixpkgs.lib.genAttrs [
        #"aarch64-linux"
        #"i686-linux"
        "x86_64-linux"
        #"aarch64-darwin"
        #"x86_64-darwin"
      ];
    in rec {
      # Your custom packages
      # Acessible through 'nix build', 'nix shell', etc
      packages = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./pkgs { inherit pkgs; });

      # Devshell for bootstrapping
      # Acessible through 'nix develop' or 'nix-shell' (legacy)
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in import ./shell.nix { inherit pkgs; });

      # Your custom packages and modifications, exported as overlays
      overlays = import ./overlays;
      # Reusable nixos modules you might want to export
      # These are usually stuff you would upstream into nixpkgs
      nixosModules = import ./modules/nixos;
      # Reusable home-manager modules you might want to export
      # These are usually stuff you would upstream into home-manager
      homeManagerModules = import ./modules/home-manager;

      # NixOS configuration entrypoint
      # Available through 'nixos-rebuild --flake .#your-hostname'
      #nixosConfigurations = let
      #  mkHost = system: hostname:
      #    nixpkgs.lib.nixosSystem {
      #      #pkgs = packages.${system};#legacyPackages.${system};
      #      modules = [ ./nixos/${hostname}/configuration.nix ]
      #        ++ (builtins.attrValues nixosModules);
      #        specialArgs = { inherit inputs outputs; };
      #    };
      #in {
      #  calvin = mkHost "x86_64-linux" "calvin";
      #  homeassistant = mkHost "x86_64-linux" "homeassistant";
      #  mowteng = mkHost "x86_64-linux" "mowteng";
      #};
      nixosConfigurations = {
        mowteng = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/mowteng/configuration.nix ]
            ++ (builtins.attrValues nixosModules);
          specialArgs = { inherit inputs outputs; };
        };
      };

      nixosConfigurations = {
        homeassistant = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/homeassistant/configuration.nix ]
            ++ (builtins.attrValues nixosModules);
          specialArgs = { inherit inputs outputs; };
        };
      };

      nixosCOnfigurations = {
        consolero = nixpkgs.lib.nixosSystem {
          modules = [ ./nixos/consolero/configuration.nix ]
          ++ (builtins.attrValues nixosModules);
          specialArgs = { inherit inputs outputs; };
        };
      };

      # Standalone home-manager configuration entrypoint
      # Available through 'home-manager --flake .#your-username@your-hostname'
      homeConfigurations = {
        "nokogiri@mowteng" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/mowteng.nix
          ];
        };
      };
      homeConfigurations = {
        "nokogiri@homeassistant" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/homeassistant.nix
          ];
        };
      };

      homeConfigurations = {
        "nokogiri@consolero" = home-manager.lib.homeManagerConfiguration {
          pkgs =
            nixpkgs.legacyPackages.x86_64-linux; # Home-manager requires 'pkgs' instance
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [
            # > Our main home-manager configuration file <
            ./home-manager/consolero.nix
          ];
        };
      };
    };
}
