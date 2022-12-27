{
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
  services.nginx = {
    enable = true;
    user = "nokogiri";
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
  };
}
