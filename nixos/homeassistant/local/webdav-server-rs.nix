{
  services.webdav-server-rs = {
    enable = true;
    settings = {
      server.listen = [ "127.0.0.1:4918" ];
      accounts = {
        auth-type = "pam";
        acct-type = "unix";
      };
      pam = {
        service = "login";
        cache-timeout = 120;
        threads = 8;
      };
      location = [
        {
          route = [ "/pub/*path" ];
          directory = "/srv/www/dav";
          handler = "filesystem";
          auth = "false";
          methods = [ "webdav-rw" ];
          autoindex = true;
        }
        {
          route = [ "/user/:user/*path" ];
          directory = "~";
          handler = "filesystem";
          methods = [ "webdav-rw" ];
          on_notfound = "return";
          autoindex = true;
          auth = "true";
          setuid = false;
        }
      ];
    };
  };
}
