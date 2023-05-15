{ pkgs, config, lib, ... }:

{
  services.nginx = {
    enable = true;
    virtualHosts."cache.fishoeder.net" = {
      serverAliases = [ "cache" ];
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/".extraConfig = ''
        proxy_pass http://localhost:${toString config.services.nix-serve.port};
        proxy_set_header Host $host;
        proxy_set_header X-Real-IP $remote_addr;
        proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
      '';
    };
  };
}

