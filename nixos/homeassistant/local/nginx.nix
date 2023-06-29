{ config, ... }: {
  imports = [ (./sites/foodwiki.nix) (./sites/cache.nix) ];

  sops.secrets.ovh_dns = {
    sopsFile = ../../common/secrets.yaml;
    owner = "acme";
  };

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
    recommendedGzipSettings = true;
    recommendedOptimisation = true;
    #recommendedProxySettings = true;
    #recommendedTlsSettings = true;

    virtualHosts."haos.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      locations."/" = {
        proxyPass = "http://192.168.178.57:8123";
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

    virtualHosts."files.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/files";
    };

    virtualHosts."git.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/git";
    };

    virtualHosts = {
      "vault.fishoeder.net" = {
        forceSSL = true;
        useACMEHost = "fishoeder.net";
        locations."/" = {
          proxyPass =
            "http://localhost:8812"; # changed the default rocket port due to some conflict
          proxyWebsockets = true;
        };
        locations."/notifications/hub" = {
          proxyPass = "http://localhost:3012";
          proxyWebsockets = true;
        };
        locations."/notifications/hub/negotiate" = {
          proxyPass = "http://localhost:8812";
          proxyWebsockets = true;
        };
      };
    };

    virtualHosts."dav.fishoeder.net" = {
      forceSSL = true;
      useACMEHost = "fishoeder.net";
      locations."/" = {
        proxyPass = "http://127.0.0.1:8765";
        extraConfig = "proxy_buffering off;"
          #+ "client_max_body_size  0;"
          + "proxy_read_timeout    120s;" + "proxy_connect_timeout 90s;"
          + "proxy_send_timeout    90s;" + "proxy_redirect        off;"
          + "proxy_set_header      Host $host;"
          + "proxy_set_header      X-Forwarded-For $proxy_add_x_forwarded_for;"
          + "proxy_set_header      X-Forwarded-Proto $scheme;";
        #+ "proxy_set_header      X-Forwarded-Ssl on;"
        #+ "proxy_set_header      Connection \"\";"
        #+ "proxy_pass_header     Date;";
      };
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
  };
}
