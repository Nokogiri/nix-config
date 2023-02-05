{ pkgs, config, lib, ... }:

{
  imports = [ (./sites/foodwiki.nix) ];
  sops.secrets.ovh_dns = { owner = "acme"; };

  security.acme = {
    acceptTerms = true;
    defaults = {
      credentialsFile = "/run/secrets/ovh_dns";
      dnsProvider = "ovh";
      email = "nokogiri@gefjon.org";
      group = "nginx";
      renewInterval = "daily";
    };

    certs = {
      "fishoeder.net" = {
        domain = "fishoeder.net";
        extraDomainNames = [ "*.fishoeder.net" ];
      };
      "gefjon.org" = {
        domain = "gefjon.org";
        extraDomainNames = [ "*.gefjon.org" ];
      };
    };
  };

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  services.phpfpm.pools.general = {
    user = "nokogiri";
    group = "users";
    settings = {
      pm = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "pm.max_children" = 32;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 2;
      "pm.max_spare_servers" = 4;
      "pm.max_requests" = 500;
    };
  };

  services.nginx = {
    enable = true;
    user = "nokogiri";
    virtualHosts."git.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/git";
    };

    virtualHosts."media.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://10.200.200.1:8096";
        extraConfig = "proxy_redirect off;"
          + "proxy_set_header Range $http_range;"
          + "proxy_set_header If-Range $http_if_range;"
          + "proxy_set_header X-Real-IP $remote_addr;"
          + "proxy_set_header Host $host;"
          + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
          + "proxy_set_header X-Forwarded-Protocol $scheme;"
          + "proxy_http_version 1.1;"
          + "proxy_set_header Upgrade $http_upgrade;"
          + ''proxy_set_header Connection "upgrade";'';
      };
    };

    virtualHosts."next.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/" = {
        proxyPass = "https://127.0.0.1:4443";
        extraConfig = "proxy_redirect off;"
          + "proxy_set_header Range $http_range;"
          + "proxy_set_header If-Range $http_if_range;"
          + "proxy_set_header X-Real-IP $remote_addr;"
          + "proxy_set_header Host $host;"
          + "proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;"
          + "proxy_set_header X-Forwarded-Protocol $scheme;"
          + "proxy_http_version 1.1;"
          + "proxy_set_header Upgrade $http_upgrade;"
          + ''proxy_set_header Connection "upgrade";'';
      };
    };

  };
}

