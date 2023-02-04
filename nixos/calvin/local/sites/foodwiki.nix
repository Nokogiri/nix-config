{ pkgs, config, lib, ... }:

{

  services.phpfpm.pools.foodwiki = {
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
    #user = "nokogiri";
    virtualHosts."food.fishoeder.net" = {
      useACMEHost = "fishoeder.net";
      forceSSL = true;
      root = "/srv/www/apps/foodwiki";

      locations = {
        "~ /(conf/|bin/|inc/)" = { extraConfig = "deny all;"; };

        "~ ^/data/" = { extraConfig = "internal;"; };

        "~ ^/lib.*.(js|css|gif|png|ico|jpg|jpeg)$" = {
          extraConfig = "expires 365d;";
        };

        "/" = {
          priority = 1;
          index = "doku.php";
          extraConfig = "try_files $uri $uri/ @dokuwiki;";
        };

        "@dokuwiki" = {
          extraConfig = ''
            # rewrites "doku.php/" out of the URLs if you set the userwrite setting to .htaccess in dokuwiki config page
              rewrite ^/_media/(.*) /lib/exe/fetch.php?media=$1 last;
              rewrite ^/_detail/(.*) /lib/exe/detail.php?media=$1 last;
              rewrite ^/_export/([^/]+)/(.*) /doku.php?do=export_$1&id=$2 last;
              rewrite ^/(.*) /doku.php?id=$1&$args last;
          '';
        };

        "~ \\.php$" = {
          extraConfig = ''
            try_files $uri $uri/ /doku.php;
            include ${config.services.nginx.package}/conf/fastcgi_params;
            fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
            fastcgi_param REDIRECT_STATUS 200;
            fastcgi_pass unix:${config.services.phpfpm.pools."foodwiki".socket};
          '';
        };
      };
    };
  };
}

