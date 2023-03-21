{ pkgs, ... }:{
  services.cgit."git.fishoeder.net" = {
    package = pkgs.cgit-pink;
    enable = true;
    nginx.location = "/";
    scanPath = "/var/lib/gitolite";
  };
}
