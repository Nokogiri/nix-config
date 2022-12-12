{
  description = "Your new nix config";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-22.11";

    impermanence.url = "github:nix-community/impermanence";

    # Home manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    sops-nix = {
      url = "github:mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    firefox-addons = {
      url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/hyprland/v0.17.0beta";
    hyprwm-contrib.url = "github:hyprwm/contrib";
    hardware.url = "github:nixos/nixos-hardware";

    emacs-overlay.url = "github:nix-community/emacs-overlay";

    spicetify-nix.url = "github:the-argus/spicetify-nix";

    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    # Shameless plug: looking for a way to nixify your themes and make
    # everything match nicely? Try nix-colors!
    # nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
    let
      inherit (nixpkgs.lib) filterAttrs;
      inherit (builtins) mapAttrs elem;
      inherit (self) outputs;
      notBroken = x: !(x.meta.broken or false);
      supportedSystems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in rec {
      templates = import ./templates;
      nixosModules = import ./modules/nixos;
      homeManagerModules = import ./modules/home-manager;
      overlays = import ./overlays;

      packages = forAllSystems
        (system: import ./pkgs { pkgs = nixpkgs.legacyPackages.${system}; });
      devShells = forAllSystems (system: {
        default = nixpkgs.legacyPackages.${system}.callPackage ./shell.nix { };
      });

      nixosConfigurations = rec {
        # Inspiron 7425
        mowteng = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/mowteng ];
        };
        # MacBookPro9,2 Homeassistant
        homeassistant = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/homeassistant ];
        };
        # KVM Server RS 2000 SAS G8 (NetCup)
        calvin = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./hosts/calvin ];
        };
      };

      homeConfigurations = {
        "nokogiri@mowteng" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/nokogiri/mowteng.nix ];
        };
        "nokogiri@homeassistant" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/nokogiri/homeassistant.nix ];
        };
        "nokogiri@calvin" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages."x86_64-linux";
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home/nokogiri/calvin.nix ];
        };
      };
    };
}
