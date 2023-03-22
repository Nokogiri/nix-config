{ pkgs, ... }:{
  services.cgit."git.fishoeder.net" = {
    package = pkgs.cgit-pink;
    enable = true;
    nginx.location = "/";
    scanPath = "/var/lib/gitolite";
    #repos = {
      #nix-config = {
        #path = "/var/lib/gitolite/repositories/nix-config.git";
    #    path = "/var/lib/gitolite/repositories/nix-config.git";
    #    desc = "nixos configuration";
        #owner = "nokogiri";
    #  };
    #};
    settings = {
      root-desc = "Git?";
      remove-suffix = true;
      css = "https://files.fishoeder.net/css/custom.css";
      enable-follow-links = true;
      source-filter = "${pkgs.cgit}/lib/cgit/filters/syntax-highlighting.py";
    };
  };
}
