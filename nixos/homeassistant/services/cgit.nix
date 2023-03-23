{ pkgs, ... }:{
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
    };
    settings = {
      root-desc = "Git?";
      root-title = "Git?";
      remove-suffix = true;
      clone-url = "https://codeberg.org/Nokogiri/$CGIT_REPO_URL https://git.fishoeder.net/$CGIT_REPO_URL";
      css = "https://files.fishoeder.net/css/custom.css";
      enable-follow-links = true;
      enable-git-config = true;
      enable-git-clone = true;
      source-filter = "${pkgs.cgit}/lib/cgit/filters/syntax-highlighting.py";
    };
  };
}
