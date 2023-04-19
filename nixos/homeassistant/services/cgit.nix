{ pkgs, ... }: {
  services.cgit."git.fishoeder.net" = {
    package = pkgs.cgit-pink;
    enable = true;
    nginx.location = "/";
    #scanPath = "/var/lib/gitolite";
    repos = {
      nix-config = {
        path = "/var/lib/gitolite/repositories/nix-config.git";
        desc = "nixos configuration";
        owner = "nokogiri";
      };
      nixpkgs = {
        path = "/var/lib/gitolite/repositories/nixpkgs.git";
        desc = "fork of https://github.com/NixOS/nixpkgs";
        owner = "nokogiri";
        clone-url = "https://github.com/Nokogiri/nixpkgs";
      };
      iio-hyprland = {
        path = "/var/lib/gitolite/repositories/iio-hyprland.git";
        desc =
          "Personal fork of https://github.com/JeanSchoeller/iio-hyprland Listens to iio-sensor-proxy and automatically changes Hyprland output orientation";
        owner = "nokogiri";
      };
      ryzen-ppd = {
        path = "/var/lib/gitolite/repositories/ryzen-ppd.git";
        desc = "Power management daemon for AMD Ryzen Mobile processors.";
        owner = "nokogiri";
      };
      catppuccin = {
        path = "/var/lib/gitolite/repositories/catppuccin.git";
        desc = "Catppuccin in one place for me";
        owner = "nokogiri";
      };
    };
    settings = {
      root-desc = "Git?";
      root-title = "Git?";
      remove-suffix = true;
      clone-url =
        "https://codeberg.org/Nokogiri/$CGIT_REPO_URL https://git.fishoeder.net/$CGIT_REPO_URL";
      css = "https://files.fishoeder.net/css/custom.css";
      enable-follow-links = true;
      enable-git-config = true;
      enable-git-clone = true;
      source-filter = "${pkgs.cgit}/lib/cgit/filters/syntax-highlighting.py";
    };
  };
}
