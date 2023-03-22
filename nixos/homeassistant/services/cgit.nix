{ pkgs, ... }:{
  services.cgit."git.fishoeder.net" = {
    package = pkgs.cgit-pink;
    enable = true;
    nginx.location = "/";
    scanPath = "/var/lib/gitolite";
    settings = {
      css = "https://files.fishoeder.net/css/custom.css";
      enable-follow-links = true;
      source-filter = "${pkgs.cgit}/lib/cgit/filters/syntax-highlighting.py";
    };
  };
}
