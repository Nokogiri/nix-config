{ config, lib, pkgs, ... }: {
  environment = {
    systemPackages = [ pkgs.dave ];
    etc."dave/config.yaml" = {
      text = ''
        address: "127.0.0.1"
        port: "8765"
        dir: "/srv/webdav"
        #prefix: "/dav"
        users:
          nokogiri:
            password: "$2a$12$RJvmqt/UxojdL/R6gsrWNugwFwJHS6e11KKzXq6TbHg4oWUq1DnXC"
            subdir: "/nokogiri"
          admin:
            password: "$2a$12$RJvmqt/UxojdL/R6gsrWNugwFwJHS6e11KKzXq6TbHg4oWUq1DnXC"
      '';
    };
  };
  systemd.services."dave" = {
    enable = true;
    description = "dave";
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
    wantedBy = [ "default.target" ];
    serviceConfig = {
      Type = "simple";
      User = "nokogiri";
      ExecStart = "${pkgs.dave}/bin/dave --config /etc/dave/config.yaml";
      Environment = [ "PATH=/run/wrappers/bin/:$PATH" ];
    };
  };
}
